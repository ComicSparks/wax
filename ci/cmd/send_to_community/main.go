package main

import (
	"ci/commons"
	"context"
	"encoding/json"
	"fmt"
	"github.com/andersfylling/disgord"
	tgbotapi "github.com/go-telegram-bot-api/telegram-bot-api/v5"
	"io/ioutil"
	"log"
	"os"
	"strings"
)

func main() {
	githubRepository := os.Getenv("GITHUB_REPOSITORY")
	if githubRepository == "" {
		println("Env ${GITHUB_REPOSITORY} is not set")
		os.Exit(1)
	}
	// get version
	var version commons.Version
	codeFile, err := ioutil.ReadFile("version.code.txt")
	if err != nil {
		panic(err)
	}
	version.Code = strings.TrimSpace(string(codeFile))
	infoFile, err := ioutil.ReadFile("version.info.txt")
	if err != nil {
		panic(err)
	}
	version.Info = strings.TrimSpace(string(infoFile))
	// message
	var message = fmt.Sprintf(
		"%v 版本 %v 发布! \n\n"+
			"更新内容:\n"+
			"%v\n\n"+
			"https://github.com/%v/%v/releases/tag/%v",
		githubRepository, version.Code, version.Info, githubRepository, githubRepository, version.Code,
	)
	// get accounts
	tgToken := os.Getenv("TG_BOT_TOKEN")
	tgChatIdsStr := os.Getenv("TG_CHAT_IDS")
	discordToken := os.Getenv("DISCORD_BOT_TOKEN")
	discordChatIdsStr := os.Getenv("DISCORD_CHAT_IDS")
	if tgToken != "" && tgChatIdsStr != "" {
		var tgChatIds []int64
		json.Unmarshal([]byte(tgChatIdsStr), &tgChatIds)
		if len(tgChatIds) > 0 {
			sendMessageToTg(tgToken, tgChatIds, message)
		}
	}
	if discordToken != "" && discordChatIdsStr != "" {
		var discordChatIds []uint64
		json.Unmarshal([]byte(discordChatIdsStr), &discordChatIds)
		if len(discordChatIds) > 0 {
			sendMessageToDiscord(discordToken, discordChatIds, message)
		}
	}
}

func sendMessageToTg(token string, ids []int64, message string) {
	bot, err := tgbotapi.NewBotAPI(token)
	if err != nil {
		log.Panic(err)
	}
	for _, id := range ids {
		msg := tgbotapi.NewMessage(id, message)
		_, err = bot.Send(msg)
		if err != nil {
			fmt.Sprintf("Send message to tg chat : %v (error : %v)", id, err.Error())
		} else {
			fmt.Sprintf("Send message to tg chat : %v (success)", id)
		}
	}
}

func sendMessageToDiscord(token string, ids []uint64, message string) {
	client, err := disgord.NewClient(context.Background(), disgord.Config{
		BotToken: token,
	})
	if err != nil {
		fmt.Sprintf("discord login failed : %v", err.Error())
		return
	}
	for _, id := range ids {
		_, err = client.SendMsg(disgord.Snowflake(id), message)
		if err != nil {
			fmt.Sprintf("Send message to tg chat : %v (error : %v)", id, err.Error())
		} else {
			fmt.Sprintf("Send message to tg chat : %v (success)", id)
		}
	}
}
