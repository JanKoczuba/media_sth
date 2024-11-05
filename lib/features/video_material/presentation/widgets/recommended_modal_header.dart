import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:media_sth/core/presentation/styles/app_padings.dart';
import 'package:media_sth/core/presentation/styles/app_text_styles.dart';
import 'package:media_sth/core/presentation/widgets/arc.dart';
import 'package:media_sth/core/utils/context_extension.dart';
import 'package:media_sth/features/video_material/presentation/bloc/video_material_cubit.dart';

class RecommendedModalHeader extends StatelessWidget {
  const RecommendedModalHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: AppPaddings.recommendedHeaderTitle,
            child: Text(
              toBeginningOfSentenceCase(
                context.localizations.recommended,
              ),
              style: AppTextStyles.titleLarge
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          child: InkWell(
            onTap: context.read<VideoMaterialCubit>().changeScreenType,
            child: const Arc(diameter: 60),
          ),
        ),
      ],
    );
  }
}
