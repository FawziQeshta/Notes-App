import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controllers/category_note_controller.dart';
import 'package:notes/custom_widgets/custom_appbar.dart';
import 'package:notes/custom_widgets/custom_category_notes_item.dart';
import 'package:notes/models/category_note.dart';
import 'package:notes/screens/create_or_update_note_screen.dart';

class CategoryNotesScreen extends StatefulWidget {

  String categoryId;

  CategoryNotesScreen({required this.categoryId, Key? key}) : super(key: key);

  @override
  State<CategoryNotesScreen> createState() => _CategoryNotesScreenState();
}

class _CategoryNotesScreenState extends State<CategoryNotesScreen> {
  Map<int, bool> selectedFlag = {};
  bool isSelectionMode = false;

  CategoryNoteController controller = Get.find();

  @override
  void initState() {
    super.initState();
    controller.fetchData(categoryId: widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(
              title: 'Category Name',
              rightIconPath: 'assets/icons/add.svg',
              action: ()=>Get.to(const CreateOrUpdateNoteScreen())),
          body: RefreshIndicator(
            onRefresh: () => controller.fetchData(categoryId: widget.categoryId),
            child: controller.obx((data) {
              var list = data as List<CategoryNote>;
              return ListView.builder(
                itemBuilder: (context, index) {
                  selectedFlag[index] = selectedFlag[index] ?? false;
                  bool isSelected = selectedFlag[index]!;

                  return GestureDetector(
                    onLongPress: () => onLongPress(isSelected, index),
                    onTap: () => onTap(isSelected, index),
                    child: CustomCategoryNotesItem(
                        categoryNote: list[index],
                        isSelectionMode: isSelectionMode,
                        isSelected: isSelected),
                  );
                },
                itemCount: list.length,
                padding: const EdgeInsets.only(top: 25),
              );
            },
              onLoading: const Center(child: CircularProgressIndicator()),
              onError: (e) => Center(child: Text(e!)),
            ),
          ),
        floatingActionButton: _buildFABButton(),
      ),
    );
  }

  void onLongPress(bool isSelected, int index) {
    setState(() {
      selectedFlag[index] = !isSelected;
      isSelectionMode = selectedFlag.containsValue(true);
    });
  }

  void onTap(bool isSelected, int index) {
    if (isSelectionMode) {
      setState(() {
        selectedFlag[index] = !isSelected;
        isSelectionMode = selectedFlag.containsValue(true);
      });
    } else {
      // Open Detail Page
    }
  }

  Future<bool> _onBackPressed() async {
    if(selectedFlag.containsValue(true)) {
        setState(() {
          isSelectionMode = false;
          selectedFlag.clear();
        });
      return false;
    } else {
      return true;
    }
  }

  Widget? _buildFABButton() {
    if (isSelectionMode) {
      bool isFalseAvailable = selectedFlag.containsValue(false);  // check if all item is not selected
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: null,
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10,),
          FloatingActionButton(
            onPressed: _selectAll,
            child: Icon(
              isFalseAvailable ? Icons.done_all : Icons.remove_done,
            ),
          ),
        ],
      );
    } else {
      return null;
    }
  }

  void _selectAll() {
    bool isFalseAvailable = selectedFlag.containsValue(false);
    // If false will be available then it will select all the checkbox
    // If there will be no false then it will de-select all
    selectedFlag.updateAll((key, value) => isFalseAvailable);
    setState(() {
      isSelectionMode = selectedFlag.containsValue(true);
    });
  }

}
