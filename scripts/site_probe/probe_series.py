"""Find a [合集] album and dump how chapters are linked. Mobile viewport."""

import json
from pathlib import Path

from patchright.sync_api import sync_playwright

OUT = Path(__file__).with_name("out")
OUT.mkdir(exist_ok=True)
BASE = "https://www.wn01.cfd"
QUERY = "家出ギャルを拾ったらハーレムになった話"

IPHONE = {
    "user_agent": (
        "Mozilla/5.0 (iPhone; CPU iPhone OS 17_5 like Mac OS X) "
        "AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.5 "
        "Mobile/15E148 Safari/604.1"
    ),
    "viewport": {"width": 390, "height": 844},
    "device_scale_factor": 3,
    "is_mobile": True,
    "has_touch": True,
    "locale": "zh-CN",
}


def dump(name: str, data) -> None:
    path = OUT / name
    text = data if isinstance(data, str) else json.dumps(data, ensure_ascii=False, indent=2)
    path.write_text(text, encoding="utf-8")
    print("wrote", name, "bytes", len(text))


def main() -> None:
    with sync_playwright() as p:
        browser = p.chromium.launch(headless=True)
        context = browser.new_context(**IPHONE)
        page = context.new_page()
        search = f"{BASE}/search/index.php?q={QUERY}&m=&syn=yes&f=_all&s=create_time_DESC&p=1"
        page.goto(search, wait_until="domcontentloaded", timeout=60000)
        page.wait_for_timeout(1200)
        dump("series_search_url.txt", page.url)
        hits = page.evaluate(
            """() => [...document.querySelectorAll('a')].map(a => ({
              text: (a.innerText||'').replace(/\\s+/g,' ').trim().slice(0,160),
              href: a.getAttribute('href')||''
            })).filter(x => /合集|ハーレム|photos-index/.test(x.text + x.href)).slice(0, 40)"""
        )
        dump("series_search_hits.json", hits)
        album = next((h for h in hits if "photos-index-aid-" in h["href"] and "合集" in h["text"]), None)
        if album is None:
            album = next((h for h in hits if "photos-index-aid-" in h["href"]), None)
        print("album", album)
        if not album:
            browser.close()
            return
        href = album["href"]
        if href.startswith("/"):
            href = BASE + href
        page.goto(href, wait_until="domcontentloaded", timeout=60000)
        page.wait_for_timeout(1500)
        html = page.content()
        dump("series_album.html", html)
        dump("series_album_url.txt", page.url)
        needles = ["合集", "本集", "系列", "章", "chapters", "sid", "ctl=photos", "相關", "相关"]
        snippets = []
        for needle in needles:
            start = 0
            n = 0
            while n < 6:
                i = html.find(needle, start)
                if i < 0:
                    break
                snippets.append({"needle": needle, "at": i, "text": html[max(0, i - 180) : i + 220]})
                start = i + len(needle)
                n += 1
        dump("series_snippets.json", snippets)
        links = page.evaluate(
            """() => [...document.querySelectorAll('a')].map(a => ({
              text: (a.innerText||'').replace(/\\s+/g,' ').trim().slice(0,120),
              href: a.getAttribute('href')||'',
              cls: (a.className||'').toString().slice(0,80)
            })).filter(x => x.href && !x.href.startsWith('javascript'))"""
        )
        dump("series_links.json", links)
        aid = page.url.split("photos-index-aid-")[-1].split(".")[0].split("-")[0]
        print("aid", aid)
        for path in [
            f"/?ctl=photos&act=chapters&sid={aid}&page=1&order=asc",
            f"/index.php?ctl=photos&act=chapters&sid={aid}&page=1&order=asc",
        ]:
            resp = page.request.get(BASE + path)
            body = resp.text()
            dump(f"chapters_{path.strip('/?').replace('&','_').replace('=','_')[:80]}.json", body[:4000])
            print(path, resp.status, body[:300])
        browser.close()


if __name__ == "__main__":
    main()
