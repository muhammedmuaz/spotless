/// This [AddressBottomsheet] class is used to show [BottomSheet] for getting address

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:spotless/locator.dart';
import 'package:spotless/pages/address_page/widgets/address_category_card.dart';
import 'package:spotless/shared/helper/helper.dart';
import 'package:spotless/shared/model/user/user.model.dart';
import 'package:spotless/shared/theme/theme.dart';
import 'package:spotless/shared/widgets/common_button.dart';
import 'package:spotless/shared/widgets/text_feild.dart';
import 'package:spotless/store/auth_store/auth_store.dart';

import '../../app_localizations.dart';
import '../../enum.dart';

class AddressBottomsheet extends StatefulWidget {
  final bool? isAdd;
  final AddressModel? item;
  const AddressBottomsheet({Key? key, this.isAdd, this.item}) : super(key: key);

  @override
  State<AddressBottomsheet> createState() => _AddressBottomsheetState();
}

class _AddressBottomsheetState extends State<AddressBottomsheet> {
  final AuthStore _authStore = locator.get<AuthStore>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameCtrl = TextEditingController();
  final TextEditingController _streetCtrl = TextEditingController();
  final TextEditingController _optionalCtrl = TextEditingController();
  final TextEditingController _phoneNoCtrl = TextEditingController();

  List<String> addressCategory = ['Home', 'Work', 'Other'];
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.isAdd == false && widget.item != null) {
      _nameCtrl.value = TextEditingValue(
          text: widget.item?.buildingName != null
              ? widget.item!.buildingName!
              : '');
      _streetCtrl.value = TextEditingValue(
          text:
              widget.item?.streetName != null ? widget.item!.streetName! : '');
      _optionalCtrl.value = TextEditingValue(
          text: widget.item?.landmark != null ? widget.item!.landmark! : '');
      _phoneNoCtrl.value = TextEditingValue(
          text: widget.item?.phoneNumber != null
              ? widget.item!.phoneNumber!
              : '');
      selectedIndex = int.parse(widget.item!.type!) - 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        leadingWidth: 15.w,
        leading: Container(),
        elevation: 0,
        title: Text(
          widget.isAdd == true ? "Add Address" : "Edit address",
          style: TextStyle(
              color: MainTheme.whiteTypeColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600),
        ),
        actions: [
          InkWell(
            focusColor: Colors.transparent,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(right: 16.w),
              child: CircleAvatar(
                radius: 12.sp,
                backgroundColor: MainTheme.whiteTypeColor,
                child: Icon(
                  Icons.close,
                  size: 15.sp,
                ),
              ),
            ),
          ),
        ],
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        // child: SizedBox(
        //   width: MediaQuery.of(context).size.width,
        //   height: MediaQuery.of(context).size.height - 325.h,
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20.h, bottom: 30.h),
                  child: TextFeildWidget(
                    controller: _nameCtrl,
                    labelText: 'Flat , Floor, Building Name',
                    validators: (String? value) {
                      if (value!.isEmpty) return 'Required field';
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 18.h),
                  child: TextFeildWidget(
                    controller: _streetCtrl,
                    labelText: 'Street Name',
                    validators: (String? value) {
                      if (value!.isEmpty) return 'Required field';
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.h),
                  child: TextFeildWidget(
                    controller: _optionalCtrl,
                    labelText: 'How to reach (Optional)',
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.h, bottom: 25.h),
                  child: TextFeildWidget(
                    controller: _phoneNoCtrl,
                    labelText: 'Phone Number',
                    numberkeyboard: true,
                    validators: (String? value) {
                      if (value!.isEmpty) return 'Required field';
                    },
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Save as",
                      style: TextStyle(
                          fontSize: 15.sp, color: MainTheme.blackypeColor),
                    ),
                  ],
                ),
                Container(
                  height: 31.h,
                  margin: EdgeInsets.only(top: 12.h),
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: addressCategory.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    itemBuilder: (BuildContext context, int index) {
                      String item = addressCategory[index];
                      return AddressCategoryCard(
                        index: index,
                        selectedIndex: selectedIndex,
                        name: item,
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            print(
                                "uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu ${selectedIndex + 1}");
                          });
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                  ),
                  child: MaterialButton(
                    height: 50.h,
                    onLongPress: null,
                    padding: EdgeInsets.zero,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    elevation: 0,
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.sp)),
                        borderSide:
                            const BorderSide(color: Colors.transparent)),
                    color: MainTheme.blueTypeOneColor,
                    child: Observer(builder: (BuildContext context) {
                      if (_authStore.addAddressState ==
                          LoadingStatusEnum.loading) {
                        return SizedBox(
                          height: 30.h,
                          child: LoadingIndicator(
                            colors: [Colors.white],
                            indicatorType: Indicator.lineScalePulseOutRapid,
                          ),
                        );
                      }
                      return Text(
                        widget.isAdd == true
                            ? AppTranslations.of(context)!
                                .text('ADDRESS PAGE', 'ADD ADDRESS')
                            : AppTranslations.of(context)!
                                .text('ADDRESS PAGE', 'EDIT ADDRESS'),
                        style: TextStyle(
                            color: MainTheme.whiteTypeColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600),
                      );
                    }),
                    onPressed: () {
                      removeFocus(context);
                      onSubmitAddress();
                    },
                  ),
                ),
              ],
            )),
        // ),
      ),
    );
  }

  /// this [onSubmitAddress] is used to add adress ,
  /// it will pass the [dto],[context],[isAdd] as param,
  /// [isAdd] apply according to the conditions

  onSubmitAddress() {
    if (_formKey.currentState!.validate()) {
      if (widget.isAdd == false) {
        var dto = {
          "id": widget.item!.id!,
          "building_name": "${_nameCtrl.value.text}",
          "street_name": "${_streetCtrl.value.text}",
          "landmark": "${_optionalCtrl.value.text}",
          "phone_number": "${_phoneNoCtrl.value.text}",
          "type": "${selectedIndex + 1}"
        };
        print(dto);
        _authStore.addOrEditAddressUser(dto, context: context, isAdd: false);
      } else {
        var dto = {
          "building_name": "${_nameCtrl.value.text}",
          "street_name": "${_streetCtrl.value.text}",
          "landmark": "${_optionalCtrl.value.text}",
          "phone_number": "${_phoneNoCtrl.value.text}",
          "type": "${selectedIndex + 1}"
        };
        _authStore.addOrEditAddressUser(dto, context: context, isAdd: true);
      }
    }
  }
}
