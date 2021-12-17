import 'package:desafio_mobile/app/modules/user_profile/models/user_profile_model.dart';
import 'package:desafio_mobile/app/modules/user_profile/models/user_profile_response.dart';
import 'package:desafio_mobile/app/share/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

Widget buildUserProfileCard(AsyncSnapshot<UserProfileResponse> snapshot) {
  List<UserProfileModel> userProfile = snapshot.data!.userProfile;
  return ListView.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      ColorsPalette.primaryColorAux,
                      ColorsPalette.primaryColor,
                    ],
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CircleAvatar(
                        radius: 60.0,
                        backgroundImage: NetworkImage(userProfile[index].picture),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Text(
                      userProfile[index].name,
                      style: TextStyle(fontSize: 26, color: ColorsPalette.textColorDark),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.email,
                          color: ColorsPalette.textColorLight,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          userProfile[index].email,
                          style: TextStyle(
                              fontSize: 16, color: ColorsPalette.textColorLight),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: ColorsPalette.textColorLight,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          userProfile[index].location,
                          style: TextStyle(
                              fontSize: 16, color: ColorsPalette.textColorLight),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home,
                          color: ColorsPalette.textColorLight,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        TextButton(
                            onPressed: () => Modular.to.navigate('/'),
                            child: Text(
                              "Home",
                              style:
                                  TextStyle(fontSize: 18, color: ColorsPalette.textColorLight),
                            )),

                        Text(
                          "|",
                          style: TextStyle(fontSize: 18, color: ColorsPalette.textColorLight),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.people,
                          color: ColorsPalette.textColorLight,
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        TextButton(
                            onPressed: () => Modular.to.navigate('/'),
                            child: Text(
                              "Amigos",
                              style:
                                  TextStyle(fontSize: 18, color: ColorsPalette.textColorLight),
                            )),
                      ],
                    ),
                  ],
                ),
              )),
        );
      });
}
