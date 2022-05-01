import 'package:flutter/material.dart';

class SearchAndLocationWidget extends StatelessWidget {
  const SearchAndLocationWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            height: 50,
            child: IconButton(
                iconSize: 30,
                splashColor: Colors.white,
                color: Colors.black,
                onPressed: () {},
                icon: const Icon(Icons.location_on_outlined)),
          ),
        ),
        Material(
          elevation: 5,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
            width: MediaQuery.of(context).size.width / 1.3,
            height: 50,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: const TextField(
              decoration: InputDecoration(
                  labelText: 'Найти блюдо',
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.white),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  )),
            ),
          ),
        )
      ],
    );
  }
}
