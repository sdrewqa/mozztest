class ChatData {
  static var data = [
    {
      "userName": "Виктор Власов",
      "avatarUrl": "",
      "lastMessage": {
        "text": "Я2 вdsышел",
        "isMe": true,
        "timestamp": "2023-01-22T08:15:00Z",
        "read": false
      },
      "lastTimeActive": "Вчера",
      "chatId": 0
    },
    {
      "userName": "Саша Алексеев",
      "avatarUrl": "",
      "lastMessage": {
        "text": "Я das",
        "isMe": false,
        "timestamp": "2024-01-22T08:40:00Z",
        "read": false
      },
      "lastTimeActive": "12.01.22",
      "chatId": 1
    },
    {
      "userName": "Пётр Жаринов",
      "avatarUrl": "",
      "lastMessage": {
        "text": "Я вdышел",
        "isMe": true,
        "timestamp": "2024-01-22T08:43:00Z",
        "read": false
      },
      "lastTimeActive": "2 минуты назад",
      "chatId": 2
    },
    {
      "userName": "Алина Жукова",
      "avatarUrl": "",
      "lastMessage": {
        "text": "Я daa",
        "isMe": true,
        "timestamp": "2024-01-22T09:45:00Z",
        "read": false
      },
      "lastTimeActive": "09.23",
      "chatId": 3
    }
  ];
  static var chats = [
    {
      "chatId": 0,
      "messages": [
        {
          "text": "Я2 вdsышел",
          "isMe": false,
          "timestamp": "2024-01-29T12:25:00Z",
          "read": false
        },
        {
          "text": "Я das",
          "isMe": true,
          "timestamp": "2024-01-29T12:25:00Z",
          "read": false
        },
        {
          "text": "Я вышел",
          "isMe": true,
          "timestamp": "2023-03-24T07:45:00Z",
          "read": false
        },
        {
          "text": "Я2 вdsышел",
          "isMe": false,
          "timestamp": "2022-01-29T12:25:00Z",
          "read": false
        },
        {
          "text": "Я das",
          "isMe": true,
          "timestamp": "2021-01-28T11:45:00Z",
          "read": false
        },
        {
          "text": "Я вышел",
          "isMe": true,
          "timestamp": "2020-03-24T07:45:00Z",
          "read": false
        },
        {
          "text": "Я2 вdsышел",
          "isMe": false,
          "timestamp": "2020-01-29T12:25:00Z",
          "read": false
        },
        {
          "text": "Я das",
          "isMe": true,
          "timestamp": "2020-01-28T11:45:00Z",
          "read": false
        },
        {
          "text": "Я2 вdsышел",
          "isMe": false,
          "timestamp": "2020-01-29T12:25:00Z",
          "read": false
        },
        {
          "text": "Я das",
          "isMe": true,
          "timestamp": "2020-01-28T11:45:00Z",
          "read": false
        },
        {
          "text": "Я2 вdsышел",
          "isMe": false,
          "timestamp": "2020-01-29T12:25:00Z",
          "read": false
        },
        {
          "text": "Я das",
          "isMe": true,
          "timestamp": "2020-01-28T11:45:00Z",
          "read": false
        },
        {
          "text": "Я das",
          "isMe": true,
          "timestamp": "2020-01-28T11:45:00Z",
          "read": false
        },
        {
          "text": "Я das",
          "isMe": true,
          "timestamp": "2020-01-28T11:45:00Z",
          "read": false
        },
        {
          "text": "Я das",
          "isMe": true,
          "timestamp": "2020-01-28T11:45:00Z",
          "read": false
        },
        {
          "text": "Я das",
          "isMe": true,
          "timestamp": "2020-01-28T11:45:00Z",
          "read": false
        },
        {
          "text": "Я das",
          "isMe": true,
          "timestamp": "2020-01-28T11:45:00Z",
          "read": false
        },
      ]
    },
    {
      "chatId": 1,
      "messages": [
        {
          "text": "Я das",
          "isMe": false,
          "timestamp": "2024-04-22T09:45:00Z",
          "read": false
        },
        {
          "text": "Я2 вdsышел",
          "isMe": false,
          "timestamp": "2024-03-22T08:35:00Z",
          "read": false
        },
        {
          "text": "Я вsышеsл",
          "isMe": true,
          "timestamp": "2024-02-22T08:45:00Z",
          "read": false
        },
      ]
    },
    {
      "chatId": 2,
      "messages": [
        {
          "text": "Я вdышел",
          "isMe": false,
          "timestamp": "2024-01-22T08:45:00Z",
          "read": false
        },
      ]
    },
    {
      "chatId": 3,
      "messages": [
        {
          "text": "Я daa",
          "isMe": true,
          "timestamp": "2024-01-23T10:45:00Z",
          "read": false
        },
        {
          "text": "Я вышел",
          "isMe": true,
          "timestamp": "2024-01-22T08:50:00Z",
          "read": false
        },
      ]
    },
  ];

  // Незнаю как реализовано на беке это все, но предположу что у каждого user есть чаты, а точнее их айдишники а чаты все чаты вместе в листе,
  // а находят их с помощью бинарного поиска по id
}
