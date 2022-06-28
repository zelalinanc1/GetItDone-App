class Item{

  final String title;
  bool isDone;

  Item({required this.title,this.isDone=false});

  Item.fromMap(Map<String,dynamic> map):title=map['title'],isDone=map['isDone'];

  Map<String,dynamic> toMap()=>{'title':title,'isDone':isDone};

  void toggleStatus(){
    isDone=!isDone;
  }




}