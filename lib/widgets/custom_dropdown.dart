import 'widgets_imports.dart';

class CustomDropdown<T> extends StatelessWidget {
  CustomDropdown({
    Key? key,
    required this.items,
    required this.onChanged,
    required this.label,
    this.selectedValue,
    this.width = .45,
    this.hasSearch = false,
  }) : super(key: key);

  final List<DropdownMenuItem<T>> items;
  final String label;
  final T? selectedValue;
  final double width;
  final T? Function(T?)? onChanged;
  final bool hasSearch;

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kWidth(width),
      height: kHeight(.07),
      child: DropdownButtonHideUnderline(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: kHeight(.062),
                child: DropdownButton2<T>(
                  isExpanded: true,
                  hint: CustomText(
                    text: label,
                    maxLines: 1,
                    textStyle: KTextStyles().normal(
                      textColor: KColors.kGrey.withOpacity(.7),
                      fontSize: 14.0,
                    ),
                  ),
                  items: items,
                  value: selectedValue,
                  onChanged: onChanged,
                  buttonStyleData: ButtonStyleData(
                    height: kHeight(.066),
                    width: kWidth(width),
                    padding: EdgeInsets.symmetric(horizontal: kWidth(.05)),
                    elevation: 0,
                    decoration: BoxDecoration(
                      color: KColors.kPrimary.withOpacity(.1),
                      borderRadius: BorderRadius.circular(kWidth(.02)),
                    ),
                  ),
                  menuItemStyleData: MenuItemStyleData(
                    height: kHeight(.046),
                    padding: EdgeInsets.symmetric(
                      horizontal: kWidth(.04),
                    ),
                  ),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: kHeight(.3),
                    width: kWidth(width),
                    padding: null,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kWidth(.04)),
                      color: KColors.kWhite,
                    ),
                    elevation: 4,
                    scrollbarTheme: const ScrollbarThemeData(
                      radius: Radius.circular(40),
                      thickness: WidgetStatePropertyAll(6),
                      thumbVisibility: WidgetStatePropertyAll(true),
                    ),
                  ),
                  autofocus: false,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                  dropdownSearchData: DropdownSearchData(
                    searchController: textEditingController,
                    searchInnerWidgetHeight: kHeight(hasSearch ? .056 : 0.0),
                    searchInnerWidget: hasSearch
                        ? Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: kWidth(.02),
                              vertical: kWidth(.02),
                            ),
                            child: TextFormField(
                              controller: textEditingController,
                              autofocus: false,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                hintText: 'Search',
                                hintStyle: const TextStyle(fontSize: 14),
                                enabledBorder: UnderlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(kWidth(.02)),
                                  borderSide:
                                      const BorderSide(color: KColors.kGrey),
                                ),
                                border: UnderlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(kWidth(.02)),
                                  borderSide:
                                      const BorderSide(color: KColors.kGrey),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderRadius:
                                      BorderRadius.circular(kWidth(.02)),
                                  borderSide:
                                      const BorderSide(color: KColors.kPrimary),
                                ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                    searchMatchFn: hasSearch
                        ? (item, searchValue) {
                            return (item.value
                                .toString()
                                .toLowerCase()
                                .contains(searchValue.toLowerCase()));
                          }
                        : null,
                    // onMenuStateChange: hasSearch
                    //     ? (isOpen) {
                    //         if (!isOpen) {
                    //           textEditingController.clear();
                    //         }
                    //       }
                    //     : null,
                  ),
                ),
              ),
            ),
            if (selectedValue != null)
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: kWidth(.05)),
                  child: CustomText(
                    text: label,
                    maxLines: 1,
                    textStyle: KTextStyles().normal(
                      textColor: KColors.kGrey.withOpacity(.7),
                      fontSize: 10.0,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
