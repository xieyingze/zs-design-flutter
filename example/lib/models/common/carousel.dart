class Carousel {
  int? showType;
  int? interval;
  int? position;
  List<CarouselItem>? list;

  Carousel({this.showType, this.interval, this.position, this.list});

  Carousel.fromJson(Map<String, dynamic> json) {
    showType = json['show_type'];
    interval = json['interval'];
    position = json['position'];
    if (json['list'] != null) {
      list = <CarouselItem>[];
      json['list'].forEach((v) {
        list!.add(new CarouselItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['show_type'] = this.showType;
    data['interval'] = this.interval;
    data['position'] = this.position;
    if (this.list != null) {
      data['list'] = this.list!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CarouselItem {
  String? pk;
  String? title;
  String? author;
  String? datetime;
  String? promotionImg;
  int? imgHeight;
  int? imgWidth;
  List<String>? statClickUrls;
  List<String>? statShowUrls;

  CarouselItem({this.pk, this.title, this.author, this.datetime, this.promotionImg, this.imgHeight, this.imgWidth, this.statClickUrls, this.statShowUrls});

  CarouselItem.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    title = json['title'];
    author = json['author'];
    datetime = json['datetime'];
    promotionImg = json['promotion_img'];
    imgHeight = json['img_height'];
    imgWidth = json['img_width'];
    statClickUrls = json['stat_click_urls'].cast<String>();
    statShowUrls = json['stat_show_urls'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk'] = this.pk;
    data['title'] = this.title;
    data['author'] = this.author;
    data['datetime'] = this.datetime;
    data['promotion_img'] = this.promotionImg;
    data['img_height'] = this.imgHeight;
    data['img_width'] = this.imgWidth;
    data['stat_click_urls'] = this.statClickUrls;
    data['stat_show_urls'] = this.statShowUrls;
    return data;
  }
}
