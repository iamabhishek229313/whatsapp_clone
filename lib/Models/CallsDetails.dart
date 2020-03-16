class CallDetails {
  String name;
  String imageURL;
  String date_and_time;
  int times;
  bool incomingTrue;
  bool callTrue;
  CallDetails(
      {this.name,
      this.imageURL,
      this.date_and_time,
      this.times,
      this.incomingTrue,
      this.callTrue});
}

List<CallDetails> listOfCalls = [
  new CallDetails(
      name: "Abhishek Rai",
      imageURL: 'assets/images/person1.jpeg',
      date_and_time: '10 March, 12:26 pm',
      times: 3,
      incomingTrue: true,
      callTrue: false),
  new CallDetails(
      name: "Calvein Kalien",
      imageURL: 'assets/images/person2.jpeg',
      date_and_time: '10 March, 12:26 pm',
      times: 0,
      incomingTrue: false,
      callTrue: false),
  new CallDetails(
      name: "Tommy Dear",
      imageURL: 'assets/images/person3.jpg',
      date_and_time: '10 March, 12:26 pm',
      times: 3,
      incomingTrue: false,
      callTrue: false),
  new CallDetails(
      name: "Pop rocket",
      imageURL: 'assets/images/person4.jpg',
      date_and_time: '10 March, 12:26 pm',
      times: 0,
      incomingTrue: true,
      callTrue: true),
  new CallDetails(
      name: "Adddeny",
      imageURL: 'assets/images/person5.jpeg',
      date_and_time: '10 March, 12:26 pm',
      times: 3,
      incomingTrue: true,
      callTrue: false),
  new CallDetails(
      name: "Jenefier Lopez",
      imageURL: 'assets/images/person6.jpg',
      date_and_time: '10 March, 12:26 pm',
      times: 3,
      incomingTrue: false,
      callTrue: true),
];
