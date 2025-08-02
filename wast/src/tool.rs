use image::ImageFormat;

#[derive(rust2go::R2G, Clone, Copy)]
pub struct ImgState {
    pub Width: i32,
    pub Height: i32,
    pub Format: i32,
}

static ERROR_IMG_STATE: ImgState = ImgState {
    Width: 0,
    Height: 0,
    Format: -1, // Invalid format
};

#[rust2go::g2r]
pub trait ImgToolCall {
    fn ImgState(path: Vec<u8>) -> ImgState;
}

impl ImgToolCall for ImgToolCallImpl {
    fn ImgState(data: Vec<u8>) -> ImgState {
        let img = image::load_from_memory(&data);
        let img = if img.is_err() {
            return ERROR_IMG_STATE;
        } else {
            img.unwrap()
        };
        let format = image::guess_format(&data);
        let format = if format.is_err() {
            -1 // Invalid format
        } else {
            match format.unwrap() {
                ImageFormat::Jpeg => {
                    1
                }
                ImageFormat::Png => {
                    2
                }
                ImageFormat::Gif => {
                    3
                }
                ImageFormat::WebP => {
                    4
                }
                _ => {
                    5 // Unsupported format
                }
            }
        };
        ImgState {
            Width: img.width() as i32,
            Height: img.height() as i32,
            Format: format,
        }
    }
}
