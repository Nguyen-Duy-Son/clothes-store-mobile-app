import 'package:clothes_store_mobile_app/app/cubits/product_by_category/product_by_category_state.dart';
import 'package:clothes_store_mobile_app/app/datasource/network_services/product_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/product_model.dart';

class ProductByCategoryCubit extends Cubit<ProductByCategoryState> {
  ProductByCategoryCubit() : super(initialProductByCategoryState([]));

  Future<void> getProductByCategory(int categoryId) async {
    emit(ProductByCategoryLoading());
    try {
      // final products = await ProductService.getProductsByCategoryId(categoryId);
      final products = productsList.where((element) => element.categoryId == categoryId).toList();
      emit(ProductByCategoryLoaded(products));
    } catch (e) {
      emit(ProductByCategoryError(e.toString()));
    }
  }
}
final List<Product> productsList = [
  {
    "price": 17,
    "name": "temporibus",
    "image": "https://loremflickr.com/640/480/fashion",
    "rating": "9",
    "categoryId": 1,
    "color": ['#000000', '#0000FF', '#008000', '#FF0000', '#FFFF00'],
    "description": "Thời trang đang là thị trường xu hướng và tiềm năng nhất của nước ta hiện nay. Khi mà cuộc sống vật chất no đủ, người ta sẽ hướng tới cái đẹp, cái hoàn mĩ hơn. Áo quần chính là một trong những thứ đó.",
    "size": [
      "S",
      "M",
      "L",
      "XL",
      "XXL",
      "XXXL"
    ],
    "imageDeatilList": [
      "https://media.istockphoto.com/id/1321017606/vi/anh/%C3%A1o-thun-v%C3%A0-%C3%A1o-s%C6%A1-mi-kh%C3%B4ng-tay-th%E1%BB%83-thao-nhi%E1%BB%81u-m%C3%A0u.jpg?s=612x612&w=0&k=20&c=Qp8DqLK_uSHilag2QLwMt8xF58t4RFD9OQEwZNnc5hc=z",
      "https://media.istockphoto.com/id/466367844/vi/anh/qu%E1%BA%A7n-%C3%A1o-l%C3%A0m-cho-ch%E1%BA%A1y-b%E1%BB%99.jpg?s=612x612&w=0&k=20&c=bypUCoTtc2-VPd9O6D4Fw3O9hJeG94h7Qka7m-jYP1Y=",
      "https://media.istockphoto.com/id/628504820/vi/anh/h%E1%BB%8D-gi%E1%BB%AF-cho-nhau-ti%E1%BA%BFp-t%E1%BB%A5c.jpg?s=612x612&w=0&k=20&c=VTu-bGHMgzQUkzAdXlNan6N8wawNnTA64weT_pHjnUc=",
      "https://media.istockphoto.com/id/1366052585/vi/anh/ch%E1%BB%A5p-%E1%BA%A3nh-m%E1%BB%99t-nh%C3%B3m-b%E1%BA%A1n-%C4%91i-ch%C6%A1i-tr%C6%B0%E1%BB%9Bc-khi-l%C3%A0m-vi%E1%BB%87c-c%C3%B9ng-nhau.jpg?s=612x612&w=0&k=20&c=4fSC1J0K0jnau02r-fjut5d5pyJBqr80cWmAgAySU7c=",
      "https://media.istockphoto.com/id/1022676568/vi/vec-to/b%E1%BB%99-%C4%91%E1%BB%93-h%E1%BB%8Da-qu%E1%BA%A7n-%C3%A1o-th%E1%BB%83-d%E1%BB%A5c-th%E1%BB%83-thao.jpg?s=612x612&w=0&k=20&c=SyiVBOf-byG-RgchpFCoCpun_-BiJszfrUdcQHN7vtc=",
      "https://media.istockphoto.com/id/1022676568/vi/vec-to/b%E1%BB%99-%C4%91%E1%BB%93-h%E1%BB%8Da-qu%E1%BA%A7n-%C3%A1o-th%E1%BB%83-d%E1%BB%A5c-th%E1%BB%83-thao.jpg?s=612x612&w=0&k=20&c=SyiVBOf-byG-RgchpFCoCpun_-BiJszfrUdcQHN7vtc=",
    ],
    "id": "1"
  },
  {
    "price": 17,
    "name": "temporibus",
    "image": "https://loremflickr.com/640/480/fashion",
    "rating": "9",
    "categoryId": 1,
    "color": ['#000000', '#0000FF', '#008000', '#FF0000', '#FFFF00'],
    "description": "Thời trang đang là thị trường xu hướng và tiềm năng nhất của nước ta hiện nay. Khi mà cuộc sống vật chất no đủ, người ta sẽ hướng tới cái đẹp, cái hoàn mĩ hơn. Áo quần chính là một trong những thứ đó.",
    "size": [
      "S",
      "M",
      "L",
      "XL",
      "XXL",
      "XXXL"
    ],
    "imageDeatilList": [
      "https://media.istockphoto.com/id/1321017606/vi/anh/%C3%A1o-thun-v%C3%A0-%C3%A1o-s%C6%A1-mi-kh%C3%B4ng-tay-th%E1%BB%83-thao-nhi%E1%BB%81u-m%C3%A0u.jpg?s=612x612&w=0&k=20&c=Qp8DqLK_uSHilag2QLwMt8xF58t4RFD9OQEwZNnc5hc=z",
      "https://media.istockphoto.com/id/466367844/vi/anh/qu%E1%BA%A7n-%C3%A1o-l%C3%A0m-cho-ch%E1%BA%A1y-b%E1%BB%99.jpg?s=612x612&w=0&k=20&c=bypUCoTtc2-VPd9O6D4Fw3O9hJeG94h7Qka7m-jYP1Y=",
      "https://media.istockphoto.com/id/628504820/vi/anh/h%E1%BB%8D-gi%E1%BB%AF-cho-nhau-ti%E1%BA%BFp-t%E1%BB%A5c.jpg?s=612x612&w=0&k=20&c=VTu-bGHMgzQUkzAdXlNan6N8wawNnTA64weT_pHjnUc=",
      "https://media.istockphoto.com/id/1366052585/vi/anh/ch%E1%BB%A5p-%E1%BA%A3nh-m%E1%BB%99t-nh%C3%B3m-b%E1%BA%A1n-%C4%91i-ch%C6%A1i-tr%C6%B0%E1%BB%9Bc-khi-l%C3%A0m-vi%E1%BB%87c-c%C3%B9ng-nhau.jpg?s=612x612&w=0&k=20&c=4fSC1J0K0jnau02r-fjut5d5pyJBqr80cWmAgAySU7c=",
      "https://media.istockphoto.com/id/1022676568/vi/vec-to/b%E1%BB%99-%C4%91%E1%BB%93-h%E1%BB%8Da-qu%E1%BA%A7n-%C3%A1o-th%E1%BB%83-d%E1%BB%A5c-th%E1%BB%83-thao.jpg?s=612x612&w=0&k=20&c=SyiVBOf-byG-RgchpFCoCpun_-BiJszfrUdcQHN7vtc=",
      "https://media.istockphoto.com/id/1022676568/vi/vec-to/b%E1%BB%99-%C4%91%E1%BB%93-h%E1%BB%8Da-qu%E1%BA%A7n-%C3%A1o-th%E1%BB%83-d%E1%BB%A5c-th%E1%BB%83-thao.jpg?s=612x612&w=0&k=20&c=SyiVBOf-byG-RgchpFCoCpun_-BiJszfrUdcQHN7vtc=",
    ],
    "id": "2"
  },
  {
    "price": 17,
    "name": "temporibus",
    "image": "https://loremflickr.com/640/480/fashion",
    "rating": "9",
    "categoryId": 2,
    "color": ['#000000', '#0000FF', '#008000', '#FF0000', '#FFFF00'],
    "description": "Thời trang đang là thị trường xu hướng và tiềm năng nhất của nước ta hiện nay. Khi mà cuộc sống vật chất no đủ, người ta sẽ hướng tới cái đẹp, cái hoàn mĩ hơn. Áo quần chính là một trong những thứ đó.",
    "size": [
      "S",
      "M",
      "L",
      "XL",
      "XXL",
      "XXXL"
    ],
    "imageDeatilList": [
      "https://media.istockphoto.com/id/1321017606/vi/anh/%C3%A1o-thun-v%C3%A0-%C3%A1o-s%C6%A1-mi-kh%C3%B4ng-tay-th%E1%BB%83-thao-nhi%E1%BB%81u-m%C3%A0u.jpg?s=612x612&w=0&k=20&c=Qp8DqLK_uSHilag2QLwMt8xF58t4RFD9OQEwZNnc5hc=z",
      "https://media.istockphoto.com/id/466367844/vi/anh/qu%E1%BA%A7n-%C3%A1o-l%C3%A0m-cho-ch%E1%BA%A1y-b%E1%BB%99.jpg?s=612x612&w=0&k=20&c=bypUCoTtc2-VPd9O6D4Fw3O9hJeG94h7Qka7m-jYP1Y=",
      "https://media.istockphoto.com/id/628504820/vi/anh/h%E1%BB%8D-gi%E1%BB%AF-cho-nhau-ti%E1%BA%BFp-t%E1%BB%A5c.jpg?s=612x612&w=0&k=20&c=VTu-bGHMgzQUkzAdXlNan6N8wawNnTA64weT_pHjnUc=",
      "https://media.istockphoto.com/id/1366052585/vi/anh/ch%E1%BB%A5p-%E1%BA%A3nh-m%E1%BB%99t-nh%C3%B3m-b%E1%BA%A1n-%C4%91i-ch%C6%A1i-tr%C6%B0%E1%BB%9Bc-khi-l%C3%A0m-vi%E1%BB%87c-c%C3%B9ng-nhau.jpg?s=612x612&w=0&k=20&c=4fSC1J0K0jnau02r-fjut5d5pyJBqr80cWmAgAySU7c=",
      "https://media.istockphoto.com/id/1022676568/vi/vec-to/b%E1%BB%99-%C4%91%E1%BB%93-h%E1%BB%8Da-qu%E1%BA%A7n-%C3%A1o-th%E1%BB%83-d%E1%BB%A5c-th%E1%BB%83-thao.jpg?s=612x612&w=0&k=20&c=SyiVBOf-byG-RgchpFCoCpun_-BiJszfrUdcQHN7vtc=",
      "https://media.istockphoto.com/id/1022676568/vi/vec-to/b%E1%BB%99-%C4%91%E1%BB%93-h%E1%BB%8Da-qu%E1%BA%A7n-%C3%A1o-th%E1%BB%83-d%E1%BB%A5c-th%E1%BB%83-thao.jpg?s=612x612&w=0&k=20&c=SyiVBOf-byG-RgchpFCoCpun_-BiJszfrUdcQHN7vtc=",
    ],
    "id": "3"
  },
  {
    "price": 17,
    "name": "temporibus",
    "image": "https://loremflickr.com/640/480/fashion",
    "rating": "9",
    "categoryId": 2,
    "color": ['#000000', '#0000FF', '#008000', '#FF0000', '#FFFF00'],
    "description": "Thời trang đang là thị trường xu hướng và tiềm năng nhất của nước ta hiện nay. Khi mà cuộc sống vật chất no đủ, người ta sẽ hướng tới cái đẹp, cái hoàn mĩ hơn. Áo quần chính là một trong những thứ đó.",
    "size": [
      "S",
      "M",
      "L",
      "XL",
      "XXL",
      "XXXL"
    ],
    "imageDeatilList": [
      "https://media.istockphoto.com/id/1321017606/vi/anh/%C3%A1o-thun-v%C3%A0-%C3%A1o-s%C6%A1-mi-kh%C3%B4ng-tay-th%E1%BB%83-thao-nhi%E1%BB%81u-m%C3%A0u.jpg?s=612x612&w=0&k=20&c=Qp8DqLK_uSHilag2QLwMt8xF58t4RFD9OQEwZNnc5hc=z",
      "https://media.istockphoto.com/id/466367844/vi/anh/qu%E1%BA%A7n-%C3%A1o-l%C3%A0m-cho-ch%E1%BA%A1y-b%E1%BB%99.jpg?s=612x612&w=0&k=20&c=bypUCoTtc2-VPd9O6D4Fw3O9hJeG94h7Qka7m-jYP1Y=",
      "https://media.istockphoto.com/id/628504820/vi/anh/h%E1%BB%8D-gi%E1%BB%AF-cho-nhau-ti%E1%BA%BFp-t%E1%BB%A5c.jpg?s=612x612&w=0&k=20&c=VTu-bGHMgzQUkzAdXlNan6N8wawNnTA64weT_pHjnUc=",
      "https://media.istockphoto.com/id/1366052585/vi/anh/ch%E1%BB%A5p-%E1%BA%A3nh-m%E1%BB%99t-nh%C3%B3m-b%E1%BA%A1n-%C4%91i-ch%C6%A1i-tr%C6%B0%E1%BB%9Bc-khi-l%C3%A0m-vi%E1%BB%87c-c%C3%B9ng-nhau.jpg?s=612x612&w=0&k=20&c=4fSC1J0K0jnau02r-fjut5d5pyJBqr80cWmAgAySU7c=",
      "https://media.istockphoto.com/id/1022676568/vi/vec-to/b%E1%BB%99-%C4%91%E1%BB%93-h%E1%BB%8Da-qu%E1%BA%A7n-%C3%A1o-th%E1%BB%83-d%E1%BB%A5c-th%E1%BB%83-thao.jpg?s=612x612&w=0&k=20&c=SyiVBOf-byG-RgchpFCoCpun_-BiJszfrUdcQHN7vtc=",
      "https://media.istockphoto.com/id/1022676568/vi/vec-to/b%E1%BB%99-%C4%91%E1%BB%93-h%E1%BB%8Da-qu%E1%BA%A7n-%C3%A1o-th%E1%BB%83-d%E1%BB%A5c-th%E1%BB%83-thao.jpg?s=612x612&w=0&k=20&c=SyiVBOf-byG-RgchpFCoCpun_-BiJszfrUdcQHN7vtc=",
    ],
    "id": "4"
  },
  {
    "price": 17,
    "name": "temporibus",
    "image": "https://loremflickr.com/640/480/fashion",
    "rating": "9",
    "categoryId": 3,
    "color": ['#000000', '#0000FF', '#008000', '#FF0000', '#FFFF00'],
    "description": "Thời trang đang là thị trường xu hướng và tiềm năng nhất của nước ta hiện nay. Khi mà cuộc sống vật chất no đủ, người ta sẽ hướng tới cái đẹp, cái hoàn mĩ hơn. Áo quần chính là một trong những thứ đó.",
    "size": [
      "S",
      "M",
      "L",
      "XL",
      "XXL",
      "XXXL"
    ],
    "imageDeatilList": [
      "https://media.istockphoto.com/id/1321017606/vi/anh/%C3%A1o-thun-v%C3%A0-%C3%A1o-s%C6%A1-mi-kh%C3%B4ng-tay-th%E1%BB%83-thao-nhi%E1%BB%81u-m%C3%A0u.jpg?s=612x612&w=0&k=20&c=Qp8DqLK_uSHilag2QLwMt8xF58t4RFD9OQEwZNnc5hc=z",
      "https://media.istockphoto.com/id/466367844/vi/anh/qu%E1%BA%A7n-%C3%A1o-l%C3%A0m-cho-ch%E1%BA%A1y-b%E1%BB%99.jpg?s=612x612&w=0&k=20&c=bypUCoTtc2-VPd9O6D4Fw3O9hJeG94h7Qka7m-jYP1Y=",
      "https://media.istockphoto.com/id/628504820/vi/anh/h%E1%BB%8D-gi%E1%BB%AF-cho-nhau-ti%E1%BA%BFp-t%E1%BB%A5c.jpg?s=612x612&w=0&k=20&c=VTu-bGHMgzQUkzAdXlNan6N8wawNnTA64weT_pHjnUc=",
      "https://media.istockphoto.com/id/1366052585/vi/anh/ch%E1%BB%A5p-%E1%BA%A3nh-m%E1%BB%99t-nh%C3%B3m-b%E1%BA%A1n-%C4%91i-ch%C6%A1i-tr%C6%B0%E1%BB%9Bc-khi-l%C3%A0m-vi%E1%BB%87c-c%C3%B9ng-nhau.jpg?s=612x612&w=0&k=20&c=4fSC1J0K0jnau02r-fjut5d5pyJBqr80cWmAgAySU7c=",
      "https://media.istockphoto.com/id/1022676568/vi/vec-to/b%E1%BB%99-%C4%91%E1%BB%93-h%E1%BB%8Da-qu%E1%BA%A7n-%C3%A1o-th%E1%BB%83-d%E1%BB%A5c-th%E1%BB%83-thao.jpg?s=612x612&w=0&k=20&c=SyiVBOf-byG-RgchpFCoCpun_-BiJszfrUdcQHN7vtc=",
      "https://media.istockphoto.com/id/1022676568/vi/vec-to/b%E1%BB%99-%C4%91%E1%BB%93-h%E1%BB%8Da-qu%E1%BA%A7n-%C3%A1o-th%E1%BB%83-d%E1%BB%A5c-th%E1%BB%83-thao.jpg?s=612x612&w=0&k=20&c=SyiVBOf-byG-RgchpFCoCpun_-BiJszfrUdcQHN7vtc=",
    ],
    "id": "5"
  },
  {
    "price": 17,
    "name": "temporibus",
    "image": "https://loremflickr.com/640/480/fashion",
    "rating": "9",
    "categoryId": 3,
    "color": ['#000000', '#0000FF', '#008000', '#FF0000', '#FFFF00'],
    "description": "Thời trang đang là thị trường xu hướng và tiềm năng nhất của nước ta hiện nay. Khi mà cuộc sống vật chất no đủ, người ta sẽ hướng tới cái đẹp, cái hoàn mĩ hơn. Áo quần chính là một trong những thứ đó.",
    "size": [
      "S",
      "M",
      "L",
      "XL",
      "XXL",
      "XXXL"
    ],
    "imageDeatilList": [
      "https://media.istockphoto.com/id/1321017606/vi/anh/%C3%A1o-thun-v%C3%A0-%C3%A1o-s%C6%A1-mi-kh%C3%B4ng-tay-th%E1%BB%83-thao-nhi%E1%BB%81u-m%C3%A0u.jpg?s=612x612&w=0&k=20&c=Qp8DqLK_uSHilag2QLwMt8xF58t4RFD9OQEwZNnc5hc=z",
      "https://media.istockphoto.com/id/466367844/vi/anh/qu%E1%BA%A7n-%C3%A1o-l%C3%A0m-cho-ch%E1%BA%A1y-b%E1%BB%99.jpg?s=612x612&w=0&k=20&c=bypUCoTtc2-VPd9O6D4Fw3O9hJeG94h7Qka7m-jYP1Y=",
      "https://media.istockphoto.com/id/628504820/vi/anh/h%E1%BB%8D-gi%E1%BB%AF-cho-nhau-ti%E1%BA%BFp-t%E1%BB%A5c.jpg?s=612x612&w=0&k=20&c=VTu-bGHMgzQUkzAdXlNan6N8wawNnTA64weT_pHjnUc=",
      "https://media.istockphoto.com/id/1366052585/vi/anh/ch%E1%BB%A5p-%E1%BA%A3nh-m%E1%BB%99t-nh%C3%B3m-b%E1%BA%A1n-%C4%91i-ch%C6%A1i-tr%C6%B0%E1%BB%9Bc-khi-l%C3%A0m-vi%E1%BB%87c-c%C3%B9ng-nhau.jpg?s=612x612&w=0&k=20&c=4fSC1J0K0jnau02r-fjut5d5pyJBqr80cWmAgAySU7c=",
      "https://media.istockphoto.com/id/1022676568/vi/vec-to/b%E1%BB%99-%C4%91%E1%BB%93-h%E1%BB%8Da-qu%E1%BA%A7n-%C3%A1o-th%E1%BB%83-d%E1%BB%A5c-th%E1%BB%83-thao.jpg?s=612x612&w=0&k=20&c=SyiVBOf-byG-RgchpFCoCpun_-BiJszfrUdcQHN7vtc=",
      "https://media.istockphoto.com/id/1022676568/vi/vec-to/b%E1%BB%99-%C4%91%E1%BB%93-h%E1%BB%8Da-qu%E1%BA%A7n-%C3%A1o-th%E1%BB%83-d%E1%BB%A5c-th%E1%BB%83-thao.jpg?s=612x612&w=0&k=20&c=SyiVBOf-byG-RgchpFCoCpun_-BiJszfrUdcQHN7vtc=",
    ],
    "id": "6"
  },
  {
    "price": 17,
    "name": "temporibus",
    "image": "https://loremflickr.com/640/480/fashion",
    "rating": "9",
    "categoryId": 4,
    "color": ['#000000', '#0000FF', '#008000', '#FF0000', '#FFFF00'],
    "description": "Thời trang đang là thị trường xu hướng và tiềm năng nhất của nước ta hiện nay. Khi mà cuộc sống vật chất no đủ, người ta sẽ hướng tới cái đẹp, cái hoàn mĩ hơn. Áo quần chính là một trong những thứ đó.",
    "size": [
      "S",
      "M",
      "L",
      "XL",
      "XXL",
      "XXXL"
    ],
    "imageDeatilList": [
      "https://media.istockphoto.com/id/1321017606/vi/anh/%C3%A1o-thun-v%C3%A0-%C3%A1o-s%C6%A1-mi-kh%C3%B4ng-tay-th%E1%BB%83-thao-nhi%E1%BB%81u-m%C3%A0u.jpg?s=612x612&w=0&k=20&c=Qp8DqLK_uSHilag2QLwMt8xF58t4RFD9OQEwZNnc5hc=z",
      "https://media.istockphoto.com/id/466367844/vi/anh/qu%E1%BA%A7n-%C3%A1o-l%C3%A0m-cho-ch%E1%BA%A1y-b%E1%BB%99.jpg?s=612x612&w=0&k=20&c=bypUCoTtc2-VPd9O6D4Fw3O9hJeG94h7Qka7m-jYP1Y=",
      "https://media.istockphoto.com/id/628504820/vi/anh/h%E1%BB%8D-gi%E1%BB%AF-cho-nhau-ti%E1%BA%BFp-t%E1%BB%A5c.jpg?s=612x612&w=0&k=20&c=VTu-bGHMgzQUkzAdXlNan6N8wawNnTA64weT_pHjnUc=",
      "https://media.istockphoto.com/id/1366052585/vi/anh/ch%E1%BB%A5p-%E1%BA%A3nh-m%E1%BB%99t-nh%C3%B3m-b%E1%BA%A1n-%C4%91i-ch%C6%A1i-tr%C6%B0%E1%BB%9Bc-khi-l%C3%A0m-vi%E1%BB%87c-c%C3%B9ng-nhau.jpg?s=612x612&w=0&k=20&c=4fSC1J0K0jnau02r-fjut5d5pyJBqr80cWmAgAySU7c=",
      "https://media.istockphoto.com/id/1022676568/vi/vec-to/b%E1%BB%99-%C4%91%E1%BB%93-h%E1%BB%8Da-qu%E1%BA%A7n-%C3%A1o-th%E1%BB%83-d%E1%BB%A5c-th%E1%BB%83-thao.jpg?s=612x612&w=0&k=20&c=SyiVBOf-byG-RgchpFCoCpun_-BiJszfrUdcQHN7vtc=",
      "https://media.istockphoto.com/id/1022676568/vi/vec-to/b%E1%BB%99-%C4%91%E1%BB%93-h%E1%BB%8Da-qu%E1%BA%A7n-%C3%A1o-th%E1%BB%83-d%E1%BB%A5c-th%E1%BB%83-thao.jpg?s=612x612&w=0&k=20&c=SyiVBOf-byG-RgchpFCoCpun_-BiJszfrUdcQHN7vtc=",
    ],
    "id": "7"
  },

  {
    "price": 17,
    "name": "temporibus",
    "image": "https://loremflickr.com/640/480/fashion",
    "rating": "9",
    "categoryId": 4,
    "color": ['#000000', '#0000FF', '#008000', '#FF0000', '#FFFF00'],
    "description": "Thời trang đang là thị trường xu hướng và tiềm năng nhất của nước ta hiện nay. Khi mà cuộc sống vật chất no đủ, người ta sẽ hướng tới cái đẹp, cái hoàn mĩ hơn. Áo quần chính là một trong những thứ đó.",
    "size": [
      "S",
      "M",
      "L",
      "XL",
      "XXL",
      "XXXL"
    ],
    "imageDeatilList": [
      "https://media.istockphoto.com/id/1321017606/vi/anh/%C3%A1o-thun-v%C3%A0-%C3%A1o-s%C6%A1-mi-kh%C3%B4ng-tay-th%E1%BB%83-thao-nhi%E1%BB%81u-m%C3%A0u.jpg?s=612x612&w=0&k=20&c=Qp8DqLK_uSHilag2QLwMt8xF58t4RFD9OQEwZNnc5hc=z",
      "https://media.istockphoto.com/id/466367844/vi/anh/qu%E1%BA%A7n-%C3%A1o-l%C3%A0m-cho-ch%E1%BA%A1y-b%E1%BB%99.jpg?s=612x612&w=0&k=20&c=bypUCoTtc2-VPd9O6D4Fw3O9hJeG94h7Qka7m-jYP1Y=",
      "https://media.istockphoto.com/id/628504820/vi/anh/h%E1%BB%8D-gi%E1%BB%AF-cho-nhau-ti%E1%BA%BFp-t%E1%BB%A5c.jpg?s=612x612&w=0&k=20&c=VTu-bGHMgzQUkzAdXlNan6N8wawNnTA64weT_pHjnUc=",
      "https://media.istockphoto.com/id/1366052585/vi/anh/ch%E1%BB%A5p-%E1%BA%A3nh-m%E1%BB%99t-nh%C3%B3m-b%E1%BA%A1n-%C4%91i-ch%C6%A1i-tr%C6%B0%E1%BB%9Bc-khi-l%C3%A0m-vi%E1%BB%87c-c%C3%B9ng-nhau.jpg?s=612x612&w=0&k=20&c=4fSC1J0K0jnau02r-fjut5d5pyJBqr80cWmAgAySU7c=",
      "https://media.istockphoto.com/id/1022676568/vi/vec-to/b%E1%BB%99-%C4%91%E1%BB%93-h%E1%BB%8Da-qu%E1%BA%A7n-%C3%A1o-th%E1%BB%83-d%E1%BB%A5c-th%E1%BB%83-thao.jpg?s=612x612&w=0&k=20&c=SyiVBOf-byG-RgchpFCoCpun_-BiJszfrUdcQHN7vtc=",
      "https://media.istockphoto.com/id/1022676568/vi/vec-to/b%E1%BB%99-%C4%91%E1%BB%93-h%E1%BB%8Da-qu%E1%BA%A7n-%C3%A1o-th%E1%BB%83-d%E1%BB%A5c-th%E1%BB%83-thao.jpg?s=612x612&w=0&k=20&c=SyiVBOf-byG-RgchpFCoCpun_-BiJszfrUdcQHN7vtc=",
    ],
    "id": "8"
  },
].map((item) => Product.fromJson(item)).toList();