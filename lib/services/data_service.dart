import 'package:gym_fitness_ui/models/app_item.dart';

class DataService {
  static List<AppItem> get items => List.generate(8, (i) => AppItem(
        id: 'item_$i',
        title: 'Premium Item ${i + 1}',
        subtitle: 'Curated content for Gym Fitness UI',
        imageUrl: 'https://picsum.photos/seed/gym_fitness_ui$i/400/300',
      ));
}
