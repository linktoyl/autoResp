package cn.sterling.autoresp.chat.ws;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

/**
 * Created by linktoyl on 2017/7/23.
 */
@RequestMapping("websocket")
public class WebsocketEndPoint extends TextWebSocketHandler {
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        System.out.println("Connection Establied!");

        super.afterConnectionEstablished(session);
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        System.out.println("Text Message !");

        super.handleTextMessage(session, message);
        TextMessage returnMessage = new TextMessage(message.getPayload()+ "received at server");
        session.sendMessage(returnMessage);
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        System.out.println("Connection Closed !");

        super.afterConnectionClosed(session, status);
    }
}
