

import 'package:care_tutors/app/features/data/local/source/hive_files.dart';
import 'package:care_tutors/app/features/data/local/source/hive_files_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final filesProvider = Provider<HiveFiles>((ref) => HiveFilesImpl());