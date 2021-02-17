import 'package:alarm_loop/const/all_const.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BaseWidget {
  static Widget buildLogo(String imgLogo, double height) {
    return SizedBox(
      height: height,
      child: Image.asset(imgLogo),
    );
  }

  static Widget buildLoading() {
    return CupertinoActivityIndicator();
  }

  static buildAppBarTitle(String title, {bool textAlignCenter}) {
    textAlignCenter = textAlignCenter ?? GetPlatform.isAndroid;
    return AutoSizeText(
      title,
      textAlign: textAlignCenter ? TextAlign.center : TextAlign.left,
      style: AppStyle.textTitleWhiteStyle,
      textScaleFactor: 1,
      maxLines: 2,
    );
  }

  static Widget buidTitle(String title) {
    return Text(
      title,
      textScaleFactor: 1,
      style:
          AppStyle.textTitleWhiteStyle.copyWith(color: AppColors.hintTextColor),
      textAlign: TextAlign.center,
    );
  }

  static Widget buildButton(String btnTitle, Function function,
      {Color color = AppColors.chipColor,
      bool isLoading = false,
      bool showLoading = true}) {
    return Container(
      width: double.infinity,
      height: AppDimens.btnMedium,
      child: ElevatedButton(
        onPressed: !isLoading ? function : null,
        style: ElevatedButton.styleFrom(
          primary: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        child: Stack(
          children: [
            Center(
              child: Text(btnTitle,
                  style: TextStyle(
                      fontSize: AppDimens.fontMedium, color: Colors.white)),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Visibility(
                  visible: isLoading && showLoading,
                  child: CupertinoActivityIndicator()),
            )
          ],
        ),
      ),
    );
  }

  static Widget buildSmartRefresherCustomFooter() {
    return CustomFooter(
      builder: (BuildContext context, LoadStatus mode) {
        if (mode == LoadStatus.loading) {
          return CupertinoActivityIndicator();
        } else {
          return Opacity(
            opacity: 0.0,
            child: CupertinoActivityIndicator(),
          );
        }
      },
    );
  }

  static Widget buildDivider(
      {double height = 10.0, double thickness = 1.0, double indent = 0.0}) {
    return Divider(
      height: height,
      thickness: thickness,
      indent: indent,
      endIndent: indent,
    );
  }

  static Widget buildChipVAT(int currentVatRate, Function(String) func) {
    List<String> _listVATStr = AppStr.listVAT.values.toList();
    return Container(
      decoration: BoxDecoration(
        color: AppColors.darkPrimaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(
            color: AppColors.darkPrimaryColor, style: BorderStyle.solid),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            AppStr.productDetailVAT,
            style: Get.textTheme.bodyText2,
          ).paddingOnly(bottom: AppDimens.paddingSmall),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List<Widget>.generate(AppStr.listVAT.length, (index) {
              bool isChoose = AppStr.listVAT.entries
                      .firstWhere((element) => element.key == currentVatRate)
                      .value ==
                  _listVATStr[index];
              return ChoiceChip(
                padding: EdgeInsets.zero,
                backgroundColor: AppColors.appBarColor,
                selectedColor: AppColors.chipColor,
                labelStyle: TextStyle(color: Colors.white),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    side: BorderSide(
                      color: isChoose
                          ? AppColors.chipColor
                          : AppColors.appBarColor,
                    )),
                label: SizedBox(
                    width: 50,
                    child: AutoSizeText(
                      _listVATStr[index],
                      maxLines: 1,
                      textAlign: TextAlign.center,
                    )),
                selected: isChoose,
                onSelected: (val) {
                  func(_listVATStr[index]);
                },
              );
            }),
          ),
        ],
      ).paddingAll(AppDimens.paddingSmall),
    );
  }
}
