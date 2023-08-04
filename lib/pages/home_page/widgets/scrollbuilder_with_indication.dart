import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spotless/locator.dart';
import 'package:spotless/pages/home_page/widgets/category_card.dart';
import 'package:spotless/pages/home_page/widgets/indicator_card.dart';

import '../../../shared/model/product/product.model.dart';
import '../../../store/vendor_store/vendor_store.dart';

class ScrollBuilderWithIndication extends StatefulWidget {
  final List<ServiceCategoryModel>? itemList;
  final int? limt;
  final Function? onTapItem;
  const ScrollBuilderWithIndication(
      {Key? key, this.itemList, this.limt, this.onTapItem})
      : super(key: key);

  @override
  State<ScrollBuilderWithIndication> createState() =>
      _ScrollBuilderWithIndicationState();
}

class _ScrollBuilderWithIndicationState
    extends State<ScrollBuilderWithIndication> {
  final VendorStore _vendorStore = locator.get<VendorStore>();

  PageController? _controller;
  PageController? indicationController;
  int pageIndication = 0;
  double? perPage;
  int? pageLimit;

  @override
  void initState() {
    _controller = PageController(viewportFraction: .24, keepPage: true);
    indicationController = PageController(viewportFraction: .2, keepPage: true);
    pageLimit = widget.limt! - 1;
    double checkTotal = widget.itemList!.length / widget.limt!;
    perPage = checkTotal.floorToDouble();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 90.h,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                itemCount: widget.itemList!.length,
                controller: _controller!,
                padEnds: false,
                pageSnapping: false,
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                onPageChanged: (int page) async {
                  scrollController(page);
                },
                itemBuilder: (BuildContext context, int index) {
                  ServiceCategoryModel item = widget.itemList![index];
                  return CategoryCard(
                    name: item.name == null ? "" : item.name,
                    assetImage: item.imageUrl == null ? null : item.imageUrl,
                    onTap: () {
                      widget.onTapItem!();
                      _vendorStore.toSelectCategory(index, item);
                    },
                  );
                },
              ),
            ),
          ],
        ),
        Container(
          height: 33.h,
          margin: EdgeInsets.only(top: 5.h),
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.topCenter,
          child: ListView.builder(
            itemCount: perPage!.toInt(),
            controller: indicationController,
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            padding: EdgeInsets.only(left: 171.w, bottom: 10.h),
            addAutomaticKeepAlives: false,
            addRepaintBoundaries: false,
            itemBuilder: (BuildContext context, int index) {
              return IndicatorCard(
                index: index,
                pageIndex: pageIndication,
              );
            },
          ),
        ),
      ],
    );
  }

  scrollController(int page) {
    if (page > pageLimit!) {
      if (_controller!.position.userScrollDirection ==
          ScrollDirection.reverse) {
        setState(() {
          pageLimit = pageLimit! + widget.limt!;
        });

        setState(() {
          pageIndication++;
          indicationController!.animateToPage(pageIndication,
              duration: const Duration(microseconds: 5), curve: Curves.ease);
        });
      }
    }
    if (page < pageLimit! - widget.limt!) {
      setState(() {
        pageLimit = pageLimit! - widget.limt!;
      });

      setState(() {
        pageIndication--;
        indicationController!.animateToPage(pageIndication,
            duration: const Duration(microseconds: 5), curve: Curves.ease);
      });
    }
  }
}
