import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class UxResources extends StatefulWidget {
  const UxResources({super.key});

  @override
  State<UxResources> createState() => _UxResourcesState();
}

class _UxResourcesState extends State<UxResources> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: const Text('U I / U X   M A T E R I A L S'),
      ),
      body: ListView(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'UI/UX Design Basics: An Introduction',
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey[800]),
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  strutStyle: const StrutStyle(height: 1.8),
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'UI/UX design is the process of designing user interfaces and experiences for digital products such as websites, mobile applications, and software. The goal of UI/UX design is to create digital products that are easy to use, visually appealing, and provide a seamless user experience.\nHere are some of the basics of UI/UX design that you need to know:\n'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '1. User-centered design',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey[800]),
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  strutStyle: const StrutStyle(height: 1.8),
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              "The foundation of UI/UX design is user-centered design. This means that every design decision should be made with the user in mind. The designer should aim to understand the user's needs, preferences, and behaviors, and create a design that addresses those needs.\n"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '2. Visual design',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey[800]),
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  strutStyle: const StrutStyle(height: 1.8),
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'Visual design is an important aspect of UI/UX design. Visual design includes the use of colors, typography, images, and other visual elements to create a visually appealing and cohesive design.\n'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '3. Information architecture',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey[800]),
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  strutStyle: const StrutStyle(height: 1.8),
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              "Information architecture is the organization and structure of information within a digital product. This includes the navigation, content organization, and labeling of the product. A well-organized information architecture is essential for a good user experience.\n"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '4. Interaction design',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey[800]),
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  strutStyle: const StrutStyle(height: 1.8),
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              "Interaction design is the design of interactive elements within a digital product, such as buttons, menus, and forms. The goal of interaction design is to create a seamless and intuitive user experience.\n"),
                    ],
                  ),
                ),
                Text(
                  '5. Usability testing',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey[800]),
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  strutStyle: const StrutStyle(height: 1.8),
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'Usability testing is the process of testing a digital product with real users to identify any usability issues. Usability testing can be done through surveys, user interviews, or by observing users as they interact with the product.\n'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '6. Accessibility',
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey[800]),
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  strutStyle: const StrutStyle(height: 1.8),
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'Accessibility is the design of digital products for people with disabilities. This includes designing for people with visual impairments, hearing impairments, or physical disabilities. Accessibility is important for creating an inclusive user experience.\n'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  '7. Responsive design',
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w500,
                      color: Colors.blueGrey[800]),
                ),
                const SizedBox(
                  height: 15,
                ),
                RichText(
                  strutStyle: const StrutStyle(height: 1.8),
                  text: const TextSpan(
                    style: TextStyle(color: Colors.black, fontSize: 16),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'Responsive design is the design of digital products that can adapt to different screen sizes and devices. With the growing use of mobile devices, responsive design is essential for providing a good user experience across different platforms.\n\n'),
                      TextSpan(
                          text:
                              'UI/UX design is a complex and constantly evolving field. These basics should give you a good understanding of what UI/UX design is and the key elements involved in designing a digital product that provides a good user experience.')
                    ],
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
