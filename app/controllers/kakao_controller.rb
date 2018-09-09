class KakaoController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def keyboard
        
        @keyboard = {
            type: "buttons",
            buttons: ["머동머동으로","일정","라인업","글쓰기"]
        }
        
        render json: @keyboard
    end
    
    def message
        
        @input = params[:content]
        
        if @input == "머동머동으로"
            @msg = {
            message: {
                text: "머동머동",
                photo: {
                    #TODO 사진 넣기
                  url: "",
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
                buttons: ["머동머동으로","일정","라인업","글쓰기"]
              }
            }
        elsif @input == "일정"
            @msg = {
                message: {
                    text: "일정 보여주기"
                },
                keyboard: {
                type: "buttons",
                buttons: ["머동머동으로","일정","라인업","글쓰기"]
              }
            }
        elsif @input == "라인업"
            @msg = {
                message: {
                    text: "라인업 보여주기"
                },
                keyboard: {
                type: "buttons",
                buttons: ["머동머동으로","일정","라인업","글쓰기"]
              }
            }
        elsif @input == "글쓰기"
            @msg = {
                message: {
                    text: "글을 써주세요"
                },
                keyboard: {
                    type: "text"
                }
            }
        else
            @post = Jau.new
            @post.user_key = params[:user_key]
            @post.content = params[:content]
            @post.save
            
            @msg = {
                message: {
                    text: "글이 정상적으로 등록되었습니다."
                },
                keyboard: {
                    type: "buttons",
                    buttons: ["머동머동으로","일정","라인업","글쓰기"]
                }
            }
        end
        
        render json: @msg
    end
end
