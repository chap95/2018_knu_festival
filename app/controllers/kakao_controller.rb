class KakaoController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def keyboard
        
        @keyboard = {
            type: "buttons",
            buttons: ["왁자지껄 게시판에 글 올리기","왁자지껄 게시판으로 가기", "머동머동 사이트로 가기","축제 일정 보기","라인업이 어떻게 되나요?"]
        }
        
        render json: @keyboard
    end
    
    def message
        
        @input = params[:content]
        
        if @input == "머동머동 사이트로 가기"
            @msg = {
            message: {
                text: "머동머동",
                photo: {
                  url: "https://postfiles.pstatic.net/MjAxODA5MTFfMjM3/MDAxNTM2NjYxOTQ4Njc4.q2mz6tNAcSvSfd8mZkG2ze7HfX1qs75lK5BbLFkO0iog.arV7nzgGjBcy75JzDYz0iTKpAuKWotnnZ0qvyzqFwPQg.JPEG.hsj0531/%EB%A8%B8%EB%8F%99.jpg?type=w580",
                  width: 640,
                  height: 480
                },
                message_button: {
                  label: "머동머동으로",
                  url: "https://festival-site-parkgu.c9users.io/"
                }
              },
              keyboard: {
                type: "buttons",
                buttons: ["왁자지껄 게시판에 글 올리기","왁자지껄 게시판으로 가기", "머동머동 사이트로 가기","축제 일정 보기","라인업이 어떻게 되나요?"]
              }
            }
        elsif @input == "축제 일정 보기"
            @msg = {
                message: {
                    text: "일차를 골라주세요~"
                },
                keyboard: {
                type: "buttons",
                buttons: ["1일차", "2일차", "3일차"]
              }
            }
        elsif @input == "라인업이 어떻게 되나요?"
            @msg = {
                message: {
                    text: "라인업 보여주기"
                },
                keyboard: {
                type: "buttons",
                buttons: ["왁자지껄 게시판에 글 올리기","왁자지껄 게시판으로 가기", "머동머동 사이트로 가기","축제 일정 보기","라인업이 어떻게 되나요?"]
              }
            }
        elsif @input == "왁자지껄 게시판에 글 올리기"
            @msg = {
                message: {
                    text: "글을 써주세요"
                },
                keyboard: {
                    type: "text"
                }
            }
        elsif @input == "1일차"
            @msg = {
                message: {
                    text: "1일차 일정"
                },
                keyboard: {
                type: "buttons",
                buttons: ["2일차","3일차","뒤로가기"]
              }
            }
        elsif @input == "2일차"
            @msg = {
                message: {
                    text: "2일차 일정"
                },
                keyboard: {
                type: "buttons",
                buttons: ["1일차","3일차","뒤로가기"]
              }
            }
        elsif @input == "3일차"
            @msg = {
                message: {
                    text: "3일차 일정"
                },
                keyboard: {
                type: "buttons",
                buttons: ["1일차","2일차","뒤로가기"]
              }
            }
        elsif @input == "뒤로가기"
            @msg = {
                message: {
                    text: "뒤로가기를 눌렀습니다."
                },
                keyboard: {
                type: "buttons",
                buttons: ["왁자지껄 게시판에 글 올리기","왁자지껄 게시판으로 가기", "머동머동 사이트로 가기","축제 일정 보기","라인업이 어떻게 되나요?"]
              }
            }    
        else
            Message.create(body: @input)
            @msg = {
                message: {
                    text: "글이 정상적으로 등록되었습니다."
                },
                keyboard: {
                    type: "buttons",
                    buttons: ["왁자지껄 게시판에 글 올리기","왁자지껄 게시판으로 가기", "머동머동 사이트로 가기","축제 일정 보기","라인업이 어떻게 되나요?"]
                }
            }
        end
        
        render json: @msg
    end
end
