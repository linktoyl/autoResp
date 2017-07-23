<%--
  Created by IntelliJ IDEA.
  User: linktoyl
  Date: 2017/7/23
  Time: 12:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

  <meta charset="UTF-8" content="text/html">
  <title>WebSocket/SockJS Echo Sample (Adapted from Tomcat's echo sample)</title>

  <script type="text/javascript">
      var  wsServer = 'ws://localhost:8080/websocket';
      var  websocket;
      function connect() {
          websocket = new WebSocket(wsServer);
          websocket.onopen = function (evt) { onOpen(evt) };
          websocket.onclose = function (evt) { onClose(evt) };
          websocket.onmessage = function (evt) { onMessage(evt) };
          websocket.onerror = function (evt) { onError(evt) };
          function onOpen(evt) {
              alert("与服务器连接成功")
              console.log("Connected to WebSocket server.");
          }
          function onClose(evt) {
              alert("Disconnected");
          }
          function onMessage(evt) {
              alert('Retrieved data from server: ' + evt.data);
          }
          function onError(evt) {
              alert('Error occured: ' + evt.data);
          }
      }
      function sendMsg(){
          var msg=document.getElementById("content").value;
          if (msg == "") {
              alert("发送信息不可以为空");
              return;
          }
          websocket.send(msg);
      }
  </script>
</head>
<body>
<input id="connect" type="button" value="连接" onclick="connect()"><input id="content" type="text"><input type="button" id="btn_send" value="发送" onclick="sendMsg()">
</body>
</html>
