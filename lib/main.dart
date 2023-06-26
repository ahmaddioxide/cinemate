import 'dart:convert';

import 'package:cinemate/models/movie_model.dart';
import 'package:cinemate/models/now_playing_movies_response_model.dart';
import 'package:cinemate/models/popular_movies_response_model.dart';
import 'package:cinemate/models/similar_movies_response_model.dart';
import 'package:cinemate/models/trending_movies_response_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var similarMoviesResponseJson=  {
      "page": 1,
      "results": [
        {
          "adult": false,
          "backdrop_path": "/mmSSn8Yn3GbJv9MsSnD4J1LnN9l.jpg",
          "id": 988078,
          "title": "Through My Window: Across the Sea",
          "original_language": "es",
          "original_title": "A través del mar",
          "overview": "After a year of long-distance, Raquel and Ares reunite on a steamy beach trip. Faced with fresh flirtations and insecurities, will their love prevail?",
          "poster_path": "/dAyJqJ8KoglZysttC6BfVmDFQUt.jpg",
          "media_type": "movie",
          "genre_ids": [
            10749,
            18,
            35
          ],
          "popularity": 776.168,
          "release_date": "2023-06-23",
          "video": false,
          "vote_average": 6.716,
          "vote_count": 164
        },
        {
          "adult": false,
          "backdrop_path": "/xXp7TbCOKe4lB65ngkt3CuhsiAa.jpg",
          "id": 697843,
          "title": "Extraction 2",
          "original_language": "en",
          "original_title": "Extraction 2",
          "overview": "Tasked with extracting a family who is at the mercy of a Georgian gangster, Tyler Rake infiltrates one of the world's deadliest prisons in order to save them. But when the extraction gets hot, and the gangster dies in the heat of battle, his equally ruthless brother tracks down Rake and his team to Sydney, in order to get revenge.",
          "poster_path": "/7gKI9hpEMcZUQpNgKrkDzJpbnNS.jpg",
          "media_type": "movie",
          "genre_ids": [
            28,
            53
          ],
          "popularity": 4033.269,
          "release_date": "2023-06-09",
          "video": false,
          "vote_average": 7.692,
          "vote_count": 830
        },
        {
          "adult": false,
          "backdrop_path": "/4HodYYKEIsGOdinkGi2Ucz6X9i0.jpg",
          "id": 569094,
          "title": "Spider-Man: Across the Spider-Verse",
          "original_language": "en",
          "original_title": "Spider-Man: Across the Spider-Verse",
          "overview": "After reuniting with Gwen Stacy, Brooklyn’s full-time, friendly neighborhood Spider-Man is catapulted across the Multiverse, where he encounters the Spider Society, a team of Spider-People charged with protecting the Multiverse’s very existence. But when the heroes clash on how to handle a new threat, Miles finds himself pitted against the other Spiders and must set out on his own to save those he loves most.",
          "poster_path": "/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg",
          "media_type": "movie",
          "genre_ids": [
            28,
            12,
            16,
            878
          ],
          "popularity": 2550.738,
          "release_date": "2023-05-31",
          "video": false,
          "vote_average": 8.614,
          "vote_count": 1713
        },
        {
          "adult": false,
          "backdrop_path": "/7e9MVGg8efOhoA2R9XhZcGWTC5Z.jpg",
          "id": 298618,
          "title": "The Flash",
          "original_language": "en",
          "original_title": "The Flash",
          "overview": "When his attempt to save his family inadvertently alters the future, Barry Allen becomes trapped in a reality in which General Zod has returned and there are no Super Heroes to turn to. In order to save the world that he is in and return to the future that he knows, Barry's only hope is to race for his life. But will making the ultimate sacrifice be enough to reset the universe?",
          "poster_path": "/rktDFPbfHfUbArZ6OOOKsXcv0Bm.jpg",
          "media_type": "movie",
          "genre_ids": [
            878,
            28,
            12
          ],
          "popularity": 1354.359,
          "release_date": "2023-06-13",
          "video": false,
          "vote_average": 6.769,
          "vote_count": 610
        },
        {
          "adult": false,
          "backdrop_path": "/cSYLX73WskxCgvpN3MtRkYUSj1T.jpg",
          "id": 976573,
          "title": "Elemental",
          "original_language": "en",
          "original_title": "Elemental",
          "overview": "In a city where fire, water, land and air residents live together, a fiery young woman and a go-with-the-flow guy will discover something elemental: how much they have in common.",
          "poster_path": "/6oH378KUfCEitzJkm07r97L0RsZ.jpg",
          "media_type": "movie",
          "genre_ids": [
            16,
            35,
            10751,
            14,
            10749
          ],
          "popularity": 1410.702,
          "release_date": "2023-06-14",
          "video": false,
          "vote_average": 7.4,
          "vote_count": 162
        },
        {
          "adult": false,
          "backdrop_path": "/1inZm0xxXrpRfN0LxwE2TXzyLN6.jpg",
          "id": 603692,
          "title": "John Wick: Chapter 4",
          "original_language": "en",
          "original_title": "John Wick: Chapter 4",
          "overview": "With the price on his head ever increasing, John Wick uncovers a path to defeating The High Table. But before he can earn his freedom, Wick must face off against a new enemy with powerful alliances across the globe and forces that turn old friends into foes.",
          "poster_path": "/vZloFAK7NmvMGKE7VkF5UHaz0I.jpg",
          "media_type": "movie",
          "genre_ids": [
            28,
            53,
            80
          ],
          "popularity": 2755.395,
          "release_date": "2023-03-22",
          "video": false,
          "vote_average": 7.868,
          "vote_count": 3299
        },
        {
          "adult": false,
          "backdrop_path": "/nniZPBIfrep9wbx0l1529RHXeD8.jpg",
          "id": 502356,
          "title": "The Super Mario Bros. Movie",
          "original_language": "en",
          "original_title": "The Super Mario Bros. Movie",
          "overview": "While working underground to fix a water main, Brooklyn plumbers—and brothers—Mario and Luigi are transported down a mysterious pipe and wander into a magical new world. But when the brothers are separated, Mario embarks on an epic quest to find Luigi.",
          "poster_path": "/qNBAXBIQlnOThrVvA6mA2B5ggV6.jpg",
          "media_type": "movie",
          "genre_ids": [
            16,
            10751,
            12,
            14,
            35
          ],
          "popularity": 2318.376,
          "release_date": "2023-04-05",
          "video": false,
          "vote_average": 7.796,
          "vote_count": 5100
        },
        {
          "adult": false,
          "backdrop_path": "/e2Jd0sYMCe6qvMbswGQbM0Mzxt0.jpg",
          "id": 385687,
          "title": "Fast X",
          "original_language": "en",
          "original_title": "Fast X",
          "overview": "Over many missions and against impossible odds, Dom Toretto and his family have outsmarted, out-nerved and outdriven every foe in their path. Now, they confront the most lethal opponent they've ever faced: A terrifying threat emerging from the shadows of the past who's fueled by blood revenge, and who is determined to shatter this family and destroy everything—and everyone—that Dom loves, forever.",
          "poster_path": "/fiVW06jE7z9YnO4trhaMEdclSiC.jpg",
          "media_type": "movie",
          "genre_ids": [
            28,
            80,
            53
          ],
          "popularity": 6963.783,
          "release_date": "2023-05-17",
          "video": false,
          "vote_average": 7.288,
          "vote_count": 2027
        },
        {
          "adult": false,
          "backdrop_path": "/pEg9HmNmdYsYDGbnMc6ZsqrHv9s.jpg",
          "id": 561717,
          "title": "The Perfect Find",
          "original_language": "en",
          "original_title": "The Perfect Find",
          "overview": "After a high-profile firing, Jenna’s fashion career comeback hits a snag when she falls for a charming, much younger coworker — who happens to be her boss’s son. As sparks fly, Jenna must decide if she’ll risk it all on a secret romance.",
          "poster_path": "/fZXturIugHYCl7T6oLeMj1AWm7p.jpg",
          "media_type": "movie",
          "genre_ids": [
            10749,
            35
          ],
          "popularity": 110.564,
          "release_date": "2023-06-23",
          "video": false,
          "vote_average": 6.2,
          "vote_count": 17
        },
        {
          "adult": false,
          "backdrop_path": "/A47BmTUzr9tvYsG13lko9e29O53.jpg",
          "id": 76600,
          "title": "Avatar: The Way of Water",
          "original_language": "en",
          "original_title": "Avatar: The Way of Water",
          "overview": "Set more than a decade after the events of the first film, learn the story of the Sully family (Jake, Neytiri, and their kids), the trouble that follows them, the lengths they go to keep each other safe, the battles they fight to stay alive, and the tragedies they endure.",
          "poster_path": "/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg",
          "media_type": "movie",
          "genre_ids": [
            878,
            12,
            28
          ],
          "popularity": 1267.806,
          "release_date": "2022-12-14",
          "video": false,
          "vote_average": 7.679,
          "vote_count": 8830
        },
        {
          "adult": false,
          "backdrop_path": "/vnPTLSBk95XKdahOaMkTlAck5Rc.jpg",
          "id": 882569,
          "title": "Guy Ritchie's The Covenant",
          "original_language": "en",
          "original_title": "Guy Ritchie's The Covenant",
          "overview": "During the war in Afghanistan, a local interpreter risks his own life to carry an injured sergeant across miles of grueling terrain.",
          "poster_path": "/kVG8zFFYrpyYLoHChuEeOGAd6Ru.jpg",
          "media_type": "movie",
          "genre_ids": [
            10752,
            28,
            53
          ],
          "popularity": 1061.902,
          "release_date": "2023-04-19",
          "video": false,
          "vote_average": 7.745,
          "vote_count": 754
        },
        {
          "adult": false,
          "backdrop_path": "/u6bGwwMgQhcqQJKHASwN4PEcYyj.jpg",
          "id": 1129956,
          "title": "iNumber Number: Jozi Gold",
          "original_language": "en",
          "original_title": "iNumber Number: Jozi Gold",
          "overview": "When an undercover cop is tasked with investigating a historic gold heist in Johannesburg, he’s forced to choose between his conscience and the law.",
          "poster_path": "/8OkmwdxCZOVxvZq9OyDrIIKEoDK.jpg",
          "media_type": "movie",
          "genre_ids": [
            80,
            28,
            53
          ],
          "popularity": 81.491,
          "release_date": "2023-06-23",
          "video": false,
          "vote_average": 6.333,
          "vote_count": 6
        },
        {
          "adult": false,
          "backdrop_path": "/cKE9qZqYtF4jimf0GFOqKfy7NEU.jpg",
          "id": 884605,
          "title": "No Hard Feelings",
          "original_language": "en",
          "original_title": "No Hard Feelings",
          "overview": "On the brink of losing her childhood home, Maddie discovers an intriguing job listing: wealthy helicopter parents looking for someone to “date” their introverted 19-year-old son, Percy, before he leaves for college. To her surprise, Maddie soon discovers the awkward Percy is no sure thing.",
          "poster_path": "/5xeNPGbM8ImVdJACUoGpXT8Pxx3.jpg",
          "media_type": "movie",
          "genre_ids": [
            35,
            10749
          ],
          "popularity": 598.799,
          "release_date": "2023-06-15",
          "video": false,
          "vote_average": 6.415,
          "vote_count": 59
        },
        {
          "adult": false,
          "backdrop_path": "/j0IobR8VH9x0Y5koAcnB7VkPW04.jpg",
          "id": 335977,
          "title": "Indiana Jones and the Dial of Destiny",
          "original_language": "en",
          "original_title": "Indiana Jones and the Dial of Destiny",
          "overview": "Finding himself in a new era, approaching retirement, Indy wrestles with fitting into a world that seems to have outgrown him. But as the tentacles of an all-too-familiar evil return in the form of an old rival, Indy must don his hat and pick up his whip once more to make sure an ancient and powerful artifact doesn't fall into the wrong hands.",
          "poster_path": "/Af4bXE63pVsb2FtbW8uYIyPBadD.jpg",
          "media_type": "movie",
          "genre_ids": [
            12,
            28
          ],
          "popularity": 218.98,
          "release_date": "2023-06-28",
          "video": false,
          "vote_average": 4.4,
          "vote_count": 16
        },
        {
          "adult": false,
          "backdrop_path": "/qbsSovCby02T5V97Hir5cgO8415.jpg",
          "id": 929569,
          "title": "World's Best",
          "original_language": "en",
          "original_title": "World's Best",
          "overview": "Twelve-year-old mathematics genius Prem discovers his recently deceased father was a famous rapper and immediately sets out to learn more about his father’s life and passions. Empowered by imaginative hip-hop music-fueled fantasies, Prem is determined to find out if hip-hop truly is in his DNA.",
          "poster_path": "/9xvEhZZMOmLIkqe4khrtF5TkOnO.jpg",
          "media_type": "movie",
          "genre_ids": [
            10402,
            10751,
            35
          ],
          "popularity": 102.203,
          "release_date": "2023-06-23",
          "video": false,
          "vote_average": 7.75,
          "vote_count": 4
        },
        {
          "adult": false,
          "backdrop_path": "/ogsaZqVbi1lcNKoeRr680G83tgR.jpg",
          "id": 1006911,
          "title": "Make Me Believe",
          "original_language": "tr",
          "original_title": "Sen İnandır",
          "overview": "Two meddling grannies trick their adult grandkids into a meet-cute that reignites a childhood crush and old grudges.",
          "poster_path": "/q1MWxML2IuAZMLKxxNaZDQTbqU5.jpg",
          "media_type": "movie",
          "genre_ids": [
            10749,
            35
          ],
          "popularity": 84.143,
          "release_date": "2023-06-23",
          "video": false,
          "vote_average": 6.6,
          "vote_count": 13
        },
        {
          "adult": false,
          "backdrop_path": "/qWQSnedj0LCUjWNp9fLcMtfgadp.jpg",
          "id": 667538,
          "title": "Transformers: Rise of the Beasts",
          "original_language": "en",
          "original_title": "Transformers: Rise of the Beasts",
          "overview": "When a new threat capable of destroying the entire planet emerges, Optimus Prime and the Autobots must team up with a powerful faction known as the Maximals. With the fate of humanity hanging in the balance, humans Noah and Elena will do whatever it takes to help the Transformers as they engage in the ultimate battle to save Earth.",
          "poster_path": "/gPbM0MK8CP8A174rmUwGsADNYKD.jpg",
          "media_type": "movie",
          "genre_ids": [
            28,
            12,
            878
          ],
          "popularity": 2094.924,
          "release_date": "2023-06-06",
          "video": false,
          "vote_average": 7.115,
          "vote_count": 439
        },
        {
          "adult": false,
          "backdrop_path": "/thyP4ymuYo846DzMbghwja6lbY0.jpg",
          "id": 647250,
          "title": "The Machine",
          "original_language": "en",
          "original_title": "The Machine",
          "overview": "Bert Kreischer faces a familial crisis and the arrival of his estranged father when the ghost of his booze-soaked past arrives: a murderous mobster hellbent on kidnapping Bert back to the motherland to atone for his crimes. Together, he and his father must retrace the steps of his younger self in the midst of a war between a sociopathic crime family while they attempt to find common ground.",
          "poster_path": "/x9dGI7LIOMMlFzyIBUta1svft2Y.jpg",
          "media_type": "movie",
          "genre_ids": [
            35,
            28,
            80
          ],
          "popularity": 181.315,
          "release_date": "2023-05-25",
          "video": false,
          "vote_average": 5.983,
          "vote_count": 30
        },
        {
          "adult": false,
          "backdrop_path": "/35OoC3JxHXrAOg4FAa2DrPCzUX9.jpg",
          "id": 1010581,
          "title": "My Fault",
          "original_language": "es",
          "original_title": "Culpa mía",
          "overview": "Noah must leave her city, boyfriend, and friends to move into William Leister's mansion, the flashy and wealthy husband of her mother Rafaela. As a proud and independent 17 year old, Noah resists living in a mansion surrounded by luxury. However, it is there where she meets Nick, her new stepbrother, and the clash of their strong personalities becomes evident from the very beginning.",
          "poster_path": "/w46Vw536HwNnEzOa7J24YH9DPRS.jpg",
          "media_type": "movie",
          "genre_ids": [
            10749,
            18
          ],
          "popularity": 1177.509,
          "release_date": "2023-06-08",
          "video": false,
          "vote_average": 8.33,
          "vote_count": 837
        },
        {
          "adult": false,
          "backdrop_path": "/sFGENDTUNOuDbVufxksCkrDtuaT.jpg",
          "id": 713704,
          "title": "Evil Dead Rise",
          "original_language": "en",
          "original_title": "Evil Dead Rise",
          "overview": "A reunion between two estranged sisters gets cut short by the rise of flesh-possessing demons, thrusting them into a primal battle for survival as they face the most nightmarish version of family imaginable.",
          "poster_path": "/5ik4ATKmNtmJU6AYD0bLm56BCVM.jpg",
          "media_type": "movie",
          "genre_ids": [
            53,
            27
          ],
          "popularity": 1093.113,
          "release_date": "2023-04-12",
          "video": false,
          "vote_average": 7.0,
          "vote_count": 1746
        }
      ],
      "total_pages": 1000,
      "total_results": 20000
    };
    TrendingMoviesResponse similarMoviesResponse=TrendingMoviesResponse.fromJson(similarMoviesResponseJson);
    return Scaffold(
      body: Center(
        child: Text(similarMoviesResponse.results[1].title.toString(),style: const TextStyle(fontSize: 30),
        ),
      )
    );
  }
}

