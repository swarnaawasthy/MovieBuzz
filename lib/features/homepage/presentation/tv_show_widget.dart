import 'package:flutter/material.dart';
import 'package:moviemuse/core/constant/colors.dart';
import 'package:moviemuse/features/homepage/domain/tv_show_entity.dart';

class HorizontalTVShowList extends StatelessWidget {
  final List<TVShowEntity> shows;
  final Function(TVShowEntity) onSelect;

  const HorizontalTVShowList(
      {super.key, required this.shows, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: shows.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onSelect(shows[index]),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: CustomColor.globalBlue,
              ),
              padding: const EdgeInsets.all(8),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  shows[index].imageThumbnailPath ?? 'https://via.placeholder.com/100',
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class VerticalTVShowList extends StatelessWidget {
  final List<TVShowEntity> shows;

  const VerticalTVShowList({super.key, required this.shows});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: shows.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 4,horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: CustomColor.orangeColor,
            ),
            padding: const EdgeInsets.all(4),
            child: ListTile(
              title: Text(
                shows[index].name ?? '',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          );
        },
      ),
    );
  }
}
