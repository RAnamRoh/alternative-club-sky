
import 'package:domain/model/skyClubModels/faq.dart';
import 'package:flutter/material.dart';

import '../../../values/dimens.dart';

class FaqSection extends StatelessWidget {
  final List<Faq> faqs;

  const FaqSection({super.key, required this.faqs});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('FAQ\'s',
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: Dimens.dimen_30,
            foreground: Paint()..shader = LinearGradient(
              colors: <Color>[Color(0xFF00A1CA), Color(0xFF281DC5)],
            ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))
          ),
          ),
          SizedBox(height: 10,),
          _buildFaqList(context),
        ],
      ),
    );
  }

  Widget _buildFaqTile(BuildContext context, Faq faq) {
    return ExpansionTile(
      title: Text(
        faq.question,
        style: Theme.of(context).textTheme.titleSmall

      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    faq.answer,
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.grey,
                    )
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }



  Widget _buildFaqList(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: List.generate(faqs.length, (index) {
          return Column(
            children: [
              _buildFaqTile(context, faqs[index]),
              if (index != faqs.length - 1) // Add divider except for the last item
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                    height: 1,
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }

}