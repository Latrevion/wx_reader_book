import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wx_reader_book/bloc/base_bloc.dart';
import 'package:wx_reader_book/bloc/self_page_bloc.dart';
import 'package:wx_reader_book/pages/base_page.dart';
import 'package:wx_reader_book/utils/time_util.dart';
import 'package:wx_reader_book/widgets/loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SelfPage extends BasePage<SelfPageBloc> {
    SelfPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    var bloc = context.read<SelfPageBloc>();
    bloc.loadData();

    return BlocBuilder<SelfPageBloc, BaseBlocState>(builder: (context, state) {
      if (state is StateLoading) {
        return const LoadingWidget();
      }

      return getBody(bloc);
    });
  }

  Widget getBody(SelfPageBloc bloc) {
    return Container(
      color: const Color(0xffecedef),
      child: Column(
        children: [
          getHeader(),
          const SizedBox(height: 4),
          OneLineItem(
              rightContent: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Expanded(child: SizedBox()),
                  Text(
                    '${bloc.user.balance}',
                    style:
                        const TextStyle(fontSize: 11, color: Color(0xff49505a)),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    '${bloc.user.purchasedBooksCount}books have been purchased',
                    style:
                        const TextStyle(fontSize: 8, color: Color(0xffb1b7be)),
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
              iconUrl: 'assets/images/self_account.png',
              title: 'account'),
          OneLineItem(
              rightContent: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '\$${bloc.user.pricePerMonth}',
                    style:
                        const TextStyle(fontSize: 11, color: Color(0xff49505a)),
                  ),
                  const Text(
                    ' per month',
                    style: TextStyle(fontSize: 8, color: Color(0xffb1b7be)),
                  ),
                ],
              ),
              iconUrl: 'assets/images/self_infinite.png',
              title: 'Unlimited cards'),
          const SizedBox(height: 4),
          OneLineItem(
              rightContent: bloc.user.readingTime == 0
                  ? const Text(
                      "You haven't started reading this week.",
                      style: TextStyle(fontSize: 8, color: Color(0xffb1b7be)),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'ranking:${bloc.user.ranking}',
                          style: const TextStyle(
                              fontSize: 11, color: Color(0xff49505a)),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          TimeUtil.formatToHHMM(
                            bloc.user.readingTime!.toInt(),
                          ),
                          style: const TextStyle(
                              fontSize: 8, color: Color(0xffb1b7be)),
                        ),
                      ],
                    ),
              iconUrl: 'assets/images/self_ranking.png',
              title: 'Reading charts'),
          OneLineItem(
              rightContent: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Expanded(child: SizedBox()),
                  Row(
                    children: [
                      Text(
                        '${bloc.user.followersCount}',
                        style: const TextStyle(
                            fontSize: 11, color: Color(0xff49505a)),
                      ),
                      const Text(
                        ' people follow me.',
                        style: TextStyle(fontSize: 8, color: Color(0xff49505a)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    '${bloc.user.readingCount} friends are reading',
                    style:
                        const TextStyle(fontSize: 8, color: Color(0xffb1b7be)),
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
              iconUrl: 'assets/images/self_followers.png',
              title: 'follow'),
          const SizedBox(height: 4),
          const OneLineItem(
            iconUrl: 'assets/images/self_booklist.png',
            title: 'Welfare farm',
            rightContent: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(child: SizedBox()),
                Text(
                  'One answer a day',
                  style: TextStyle(fontSize: 11, color: Color(0xff49505a)),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  ' Answer the question and divide membership cards.',
                  style: TextStyle(fontSize: 8, color: Color(0xffb1b7be)),
                ),
                Expanded(child: SizedBox()),
              ],
            ),
          ),
          const SizedBox(height: 4),
          OneLineItem(
              rightContent: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Expanded(child: SizedBox()),
                  Row(
                    children: [
                      Text(
                        '${(bloc.user.notesCount??0)+(bloc.user.booksReadCount??0)+(bloc.user.likesCOunt??0)}',
                        style: const TextStyle(
                            fontSize: 11, color: Color(0xff49505a)),
                      ),
                      const Text(
                        '  notes',
                        style: TextStyle(fontSize: 8, color: Color(0xff49505a)),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    '${bloc.user.likesCOunt} friends are like',
                    style:
                        const TextStyle(fontSize: 8, color: Color(0xffb1b7be)),
                  ),
                  const Expanded(child: SizedBox()),
                ],
              ),
              iconUrl: 'assets/images/self_note.png',
              title: 'notes'),
          OneLineItem(
              rightContent: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${bloc.user.booklistsCount}',
                    style:
                        const TextStyle(fontSize: 11, color: Color(0xff49505a)),
                  ),
                  const Text(
                    ' series',
                    style: TextStyle(fontSize: 8, color: Color(0xffb1b7be)),
                  ),
                ],
              ),
              iconUrl: 'assets/images/self_booklist.png',
              title: 'Book lists')
        ],
      ),
    );
  }

  Widget getHeader() {
    return Builder(builder: (context) {
      var bloc = context.read<SelfPageBloc>();
      return Container(
        color: Colors.white,
        height: 173,
        padding: const EdgeInsets.only(left: 14, right: 14),
        child: Column(
          children: [
            const SizedBox(
              height: 29,
            ),
            const Row(
              children: [
                Icon(
                  Icons.mail_outline,
                  color: Colors.grey,
                ),
                Expanded(child: SizedBox()),
                Icon(
                  Icons.tune_outlined,
                  color: Colors.grey,
                ),
              ],
            ),
            Stack(
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                          height: 53,
                          width: 53,
                          child: ClipOval(
                            child: CachedNetworkImage(
                              imageUrl: bloc.user.avatarUrl ?? '',
                              placeholder: (context, url) =>
                                  const Icon(Icons.perm_identity),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          )),
                      const SizedBox(
                        height: 13,
                      ),
                      Text(
                        bloc.user.nickname ?? '',
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xff353c46),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Edit your profile',
                        style: TextStyle(fontSize: 8, color: Color(0xff99a0aa)),
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  right: 0,
                  top: 36,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 10,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  @override
  SelfPageBloc createBloc(BuildContext context) {
    return SelfPageBloc();
  }
}

class OneLineItem extends StatelessWidget {
  final Widget rightContent;
  final String iconUrl;
  final String title;

  const OneLineItem(
      {super.key,
      required this.rightContent,
      required this.iconUrl,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.only(left: 14, right: 14),
      width: double.infinity,
      color: Colors.white,
      child: Row(children: [
        Image.asset(
          iconUrl,
          width: 16,
          height: 16,
        ),
        const SizedBox(
          width: 7,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xff212832),
          ),
        ),
        const Expanded(child: SizedBox()),
        rightContent
      ]),
    );
  }
}
