import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviemuse/core/constant/colors.dart';
import 'package:moviemuse/features/homepage/application/tv_show_bloc.dart';
import 'package:moviemuse/features/homepage/presentation/tv_show_widget.dart';

class TVShowScreen extends StatelessWidget {
  const TVShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<TVShowBloc>(context);
    bloc.loadTVShows();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.globalBlue,
        title: const Text(
          "MovieMuse",
          style: TextStyle(color: CustomColor.whiteColor),
        ),
      ),
      body: BlocBuilder<TVShowBloc, TVShowState>(
        builder: (context, state) {
          if (state.shows == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              const SizedBox(height: 16,),
              HorizontalTVShowList(
                shows: state.shows!,
                onSelect: (show) => bloc.selectShow(show),
              ),
              const SizedBox(height: 8,),
              VerticalTVShowList(
                shows: state.shows!,
              ),
              const SizedBox(height: 8,),
              state.selectedShow != null
                  ? Container(
                      height: MediaQuery.of(context).size.height / 2.8,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: CustomColor.whiteColor,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(
                            state.selectedShow?.imageThumbnailPath ??
                                'https://via.placeholder.com/100',
                          fit: BoxFit.cover,),
                      ),
                    )
                  : const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'No image selected',
                        style: TextStyle(
                            fontSize: 16, fontStyle: FontStyle.italic),
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}
