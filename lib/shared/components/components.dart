import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view/web.dart';
import '../constants/constants.dart';


// It is a defult button used as a reusable component.
Widget defultBuildItem(list, context) => Padding (
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onTap: () {
          navigateTo(
            context,
            WebScreen(
              url: list['url'],
            ),
          );
        },
        child: SizedBox(
          width: double.infinity,
          height: 120,
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image(
                  image: NetworkImage(
                      '${list[("urlToImage")] ?? imageUrl}'),
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: Text(
                        '${list['title']}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${list['publishedAt']}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

// It is a defult divider used as a reusable component to separate the widgets.
Widget myDivider() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey[100],
      ),
    );

// It is a defult text form field used as a reusable component.
Widget defultTextFormField({
  required TextEditingController controller,
  required TextInputType,
  required String validatorText,
  required IconData prefixIcon,
  IconData? suffixIcon,
  Function? suffixIconOnPressed,
  Function? onChanged,
  Function? onSubmitted,
  String? labelText,
  String? hintText,
  bool isObSecure = false,
  double border = 20.0,
}) =>
    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(border),
        color: Colors.grey[100],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType,
        obscureText: isObSecure,
        onFieldSubmitted: (val) {
          onSubmitted!(val);
        },
        onChanged: (value){
          onChanged!(value);
        },
        validator: (val) {
          if (val == null || val.isEmpty) {
            return validatorText;
          }
          return null;
        },
        decoration: InputDecoration(
            labelText: labelText,
            hintText: hintText,
            prefixIcon: Icon(prefixIcon),
            suffixIcon: IconButton(
              icon: Icon(suffixIcon),
              onPressed: () {
                suffixIconOnPressed!();
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(border),
            )),
      ),
    );

// defult method to navigate to any screen.
void navigateTo(context, widget) async => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Widget articleBuilder(list) => ConditionalBuilder(
  condition: list.isNotEmpty,
  builder: (context) => ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) =>
        defultBuildItem(list[index], context),
    separatorBuilder: (context, index) => myDivider(),
    itemCount: list.length,
  ),
  fallback: (context) => const Center(
    child: CircularProgressIndicator(),
  ),
);