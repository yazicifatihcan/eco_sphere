part of '../faq.dart';

class _FAQCard extends StatelessWidget {
  final bool isOpen;
  final VoidCallback onTap;
  final String title;
  final String content;
  _FAQCard({
    required this.isOpen,
    required this.title,
    required this.content,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(paddingXS),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: s20W700Dark,
                    ),
                  ),
                  SvgPicture.asset(
                    isOpen ? faqCloseIcon : faqOpenIcon,
                    height: 24.horizontalScale,
                    width: 24.horizontalScale,
                  ),
                ],
              ),
              AnimatedSwitcher(
                  duration: const Duration(seconds: 1),
                  child: isOpen
                      ? Padding(
                          padding: const EdgeInsets.only(
                            top: paddingXS,
                          ),
                          child: Text(
                            content,
                            style: s16W400Dark,
                          ),
                        )
                      : const SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }
}
