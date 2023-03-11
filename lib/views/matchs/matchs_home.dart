import 'package:flutter/material.dart';

import '../../constant/matchs_constant.dart';
import '../../models/soccert_match.dart';

class MatchsHome extends StatelessWidget {
  const MatchsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "MATCHES",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: matchs.length,
                    itemBuilder: (context, index) {
                      return matchTile(matchs[index]);
                    },
                  ),
                )
              ],
            ));
  }

  Widget matchTile(SoccerMatch match) {
  var homeGoal = match.scoreLocal;
  var awayGoal = match.scoreAway;

  return Container(
    margin: const EdgeInsets.symmetric(vertical: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            match.teamLocal.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ),
        Image.network(
          match.teamLocal.urlLogo,
          width: 36.0,
        ),
        Expanded(
          child: Text(
            "$homeGoal - $awayGoal",
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ),
        Image.network(
          match.teamAway.urlLogo,
          width: 36.0,
        ),
        Expanded(
          child: Text(
            match.teamAway.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    ),
  );
}

//   Widget PageBody(List<SoccerMatch> allmatches) {
//   return Column(
//     children: [
//       Expanded(
//         flex: 2,
//         child: Container(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 teamStat("Local Team", allmatches[0].teamLocal.urlLogo,
//                     allmatches[0].teamLocal.name),
//                 goalStat(allmatches[0].teamLocal.status.elapsedTime,
//                     allmatches[0].goal.home, allmatches[0].goal.away),
//                 teamStat("Visitor Team", allmatches[0].away.logoUrl,
//                     allmatches[0].away.name),
//               ],
//             ),
//           ),
//         ),
//       ),
//       Expanded(
//         flex: 5,
//         child: Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: Color(0xFF4373D9),
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(40.0),
//               topRight: Radius.circular(40.0),
//             ),
//           ),
//           child: Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text(
//                   "MATCHES",
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 24.0,
//                   ),
//                 ),
//                 Expanded(
//                   child: ListView.builder(
//                     itemCount: allmatches.length,
//                     itemBuilder: (context, index) {
//                       return matchTile(allmatches[index]);
//                     },
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       )
//     ],
//   );
// }
 }

Widget teamStat(String team, String logoUrl, String teamName) {
  return Expanded(
    child: Column(
      children: [
        Text(
          team,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Expanded(
          child: Image.network(
            logoUrl,
            width: 54.0,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          teamName,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
      ],
    ),
  );
}

Widget goalStat(int expandedTime, int homeGoal, int awayGoal) {
  var home = homeGoal;
  var away = awayGoal;
  var elapsed = expandedTime;

  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$elapsed'",
          style: const TextStyle(
            fontSize: 30.0,
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "$home - $away",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 36.0,
              ),
            ),
          ),
        )
      ],
    ),
  );
}