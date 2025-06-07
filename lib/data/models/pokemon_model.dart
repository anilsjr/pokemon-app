// Pokemon model representing a Pokemon entity with all its details
class Pokemon {
  final String id;
  final String num;
  final String name;
  final String img;
  final List<String> type;
  final String height;
  final String weight;
  final String candy;
  final int? candyCount;
  final String egg;
  final double spawnChance;
  final double? avgSpawns;
  final String spawnTime;
  final List<double>? multipliers;
  final List<String> weaknesses;
  final List<Evolution>? nextEvolution;
  final List<Evolution>? prevEvolution;

  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.img,
    required this.type,
    required this.height,
    required this.weight,
    required this.candy,
    this.candyCount,
    required this.egg,
    required this.spawnChance,
    this.avgSpawns,
    required this.spawnTime,
    this.multipliers,
    required this.weaknesses,
    this.nextEvolution,
    this.prevEvolution,
  });

  // Factory constructor to create Pokemon from JSON
  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'].toString(),
      num: json['num'],
      name: json['name'],
      img: json['img'],
      type: List<String>.from(json['type']),
      height: json['height'],
      weight: json['weight'],
      candy: json['candy'],
      candyCount: json['candy_count'],
      egg: json['egg'],
      spawnChance: json['spawn_chance']?.toDouble() ?? 0.0,
      avgSpawns: json['avg_spawns']?.toDouble(),
      spawnTime: json['spawn_time'],
      multipliers:
          json['multipliers'] != null
              ? List<double>.from(json['multipliers'])
              : null,
      weaknesses: List<String>.from(json['weaknesses']),
      nextEvolution:
          json['next_evolution'] != null
              ? List<Evolution>.from(
                json['next_evolution'].map((x) => Evolution.fromJson(x)),
              )
              : null,
      prevEvolution:
          json['prev_evolution'] != null
              ? List<Evolution>.from(
                json['prev_evolution'].map((x) => Evolution.fromJson(x)),
              )
              : null,
    );
  }

  // Convert Pokemon to JSON object for serialization
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'num': num,
      'name': name,
      'img': img,
      'type': type,
      'height': height,
      'weight': weight,
      'candy': candy,
      'candy_count': candyCount,
      'egg': egg,
      'spawn_chance': spawnChance,
      'avg_spawns': avgSpawns,
      'spawn_time': spawnTime,
      'multipliers': multipliers,
      'weaknesses': weaknesses,
      'next_evolution': nextEvolution?.map((e) => e.toJson()).toList(),
      'prev_evolution': prevEvolution?.map((e) => e.toJson()).toList(),
    };
  }
}

// Evolution class for next_evolution and prev_evolution
class Evolution {
  final String num;
  final String name;

  Evolution({required this.num, required this.name});

  factory Evolution.fromJson(Map<String, dynamic> json) {
    return Evolution(num: json['num'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'num': num, 'name': name};
  }
}
