import 'package:flutter/material.dart';
import 'package:fruitfly/app/resources/alignments.dart';
import 'package:fruitfly/app/resources/colors.dart';

import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controllers/about_controller.dart';

class AboutView extends GetView<AboutController> {
  const AboutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: whitecolor,
        ),
        backgroundColor: const Color(0xFFFFA726),
        title: const Text(
          'About Us',
          style: TextStyle(color: whitecolor),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: ListView(
        children: [
          Image.asset("assets/images/about.png"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: crosstart,
              children: [
                const Text(
                    style: TextStyle(
                        color: blackcolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    "About Us"),
                10.heightBox,
                const Text(
                    style: TextStyle(
                        color: blackcolor,
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                    "Welcome to Cerapp"),
                5.heightBox,
                const Text(
                    style: TextStyle(color: textfieldgrey, fontSize: 14),
                    textAlign: TextAlign.justify,
                    "At Cerapp, we are dedicated to providing innovative solutions for monitoring and managing the population of the Mediterranean fruit fly (Ceratitis capitata). Our mobile app empowers clients to easily and accurately analyze Mediterranean fruit fly populations through advanced image recognition technology."),
                10.heightBox,
                const Text(
                    style: TextStyle(
                        color: blackcolor,
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                    "Our Mission"),
                5.heightBox,
                const Text(
                    style: TextStyle(color: textfieldgrey, fontSize: 14),
                    textAlign: TextAlign.justify,
                    "Our mission is to revolutionize the way agricultural professionals, researchers, and enthusiasts monitor Mediterranean fruit fly populations. By leveraging cutting-edge technology, we aim to provide a user-friendly, efficient, and reliable tool that helps in making informed decisions for pest management."),
                10.heightBox,
                const Text(
                    style: TextStyle(
                        color: blackcolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    "What We Offer"),
                10.heightBox,
                const Text(
                    style: TextStyle(
                        color: blackcolor,
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                    "Easy-to-Use Interface"),
                5.heightBox,
                const Text(
                    style: TextStyle(color: textfieldgrey, fontSize: 14),
                    textAlign: TextAlign.justify,
                    "Cerapp is designed with simplicity in mind, making it easy for users to upload or take live photos within the app for analysis."),
                10.heightBox,
                const Text(
                    style: TextStyle(
                        color: blackcolor,
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                    "Advanced Analysis"),
                5.heightBox,
                const Text(
                    style: TextStyle(color: textfieldgrey, fontSize: 14),
                    textAlign: TextAlign.justify,
                    "Our app uses state-of-the-art algorithms to quantify and identify the population of the Mediterranean fruit fly (Ceratitis capitata) in your images, providing you with accurate and actionable data."),
                10.heightBox,
                const Text(
                    style: TextStyle(
                        color: blackcolor,
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                    "Account Management"),
                5.heightBox,
                const Text(
                    style: TextStyle(color: textfieldgrey, fontSize: 14),
                    textAlign: TextAlign.justify,
                    "Users can create accounts to access personalized features, save their analysis results, and subscribe to various packages for enhanced functionalities."),
                10.heightBox,
                const Text(
                    style: TextStyle(
                        color: blackcolor,
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                    "Subscription Packages"),
                5.heightBox,
                const Text(
                    style: TextStyle(color: textfieldgrey, fontSize: 14),
                    textAlign: TextAlign.justify,
                    "We offer flexible subscription options to suit your needs, whether you're a casual user or require extensive analysis capabilities for large-scale operations."),
                10.heightBox,
                const Text(
                    style: TextStyle(
                        color: blackcolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    "Understanding the Mediterranean fruit fly (Ceratitis capitata)"),
                10.heightBox,
                const Text(
                    style: TextStyle(color: textfieldgrey, fontSize: 14),
                    textAlign: TextAlign.justify,
                    "The Mediterranean fruit fly, commonly known as Medfly (Ceratitis capitata), is one of the most destructive agricultural pests worldwide. This small, highly adaptable fly is notorious for infesting a wide variety of fruit crops, making it a significant threat to agriculture."),
                10.heightBox,
                const Text(
                    style: TextStyle(
                        color: blackcolor,
                        fontWeight: FontWeight.normal,
                        fontSize: 16),
                    "Key Characteristics:"),
                10.heightBox,
                const Text(
                    style: TextStyle(color: textfieldgrey, fontSize: 14),
                    textAlign: TextAlign.justify,
                    " 1)Appearance: Adult Mediterranean fruit flies are about 3-5 mm long, with a yellowish-brown body, mottled wings, and distinct black, white, and brown markings."),
                10.heightBox,
                const Text(
                    style: TextStyle(color: textfieldgrey, fontSize: 14),
                    textAlign: TextAlign.justify,
                    " 2)Lifecycle: The lifecycle includes egg, larval, pupal, and adult stages. Females lay eggs in ripening fruit, where the larvae then feed and develop, causing damage."),
                10.heightBox,
                const Text(
                    style: TextStyle(color: textfieldgrey, fontSize: 14),
                    textAlign: TextAlign.justify,
                    " 3)Impact: Mediterranean fruit fly infestations can lead to substantial economic losses due to crop damage and increased control costs."),
                10.heightBox,
                const Text(
                    style: TextStyle(color: textfieldgrey, fontSize: 14),
                    textAlign: TextAlign.justify,
                    "Understanding and monitoring the population of the Mediterranean fruit fly is crucial for effective pest management and crop protection. Cerapp provides the tools needed to perform this monitoring efficiently and accurately."),
                10.heightBox,
                const Text(
                    style: TextStyle(
                        color: blackcolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    "Our Team"),
                10.heightBox,
                const Text(
                    style: TextStyle(color: textfieldgrey, fontSize: 14),
                    textAlign: TextAlign.justify,
                    "Our team is composed of experienced professionals in the fields of entomology, computer science, and software development. We are passionate about creating solutions that make a real difference in the world of agriculture and pest management."),
                10.heightBox,
                const Text(
                    style: TextStyle(
                        color: blackcolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    "Why Choose Cerapp?"),
                10.heightBox,
                const Text(
                    style: TextStyle(color: textfieldgrey, fontSize: 14),
                    textAlign: TextAlign.justify,
                    "1)Accuracy: Rely on precise and reliable analysis results to inform your pest management strategies."),
                10.heightBox,
                const Text(
                    style: TextStyle(color: textfieldgrey, fontSize: 14),
                    textAlign: TextAlign.justify,
                    "2)Convenience: Take advantage of our mobile platform to conduct analyses anytime, anywhere."),
                10.heightBox,
                const Text(
                    style: TextStyle(color: textfieldgrey, fontSize: 14),
                    textAlign: TextAlign.justify,
                    "3)Support: Our dedicated support team is here to help you with any questions or issues you may encounter."),
                10.heightBox,
                const Text(
                    style: TextStyle(
                        color: blackcolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                    "Contact Us"),
                10.heightBox,
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                          text:
                              'We are always here to assist you. If you have any questions, feedback, or need support, please reach out to us at ',
                          style: TextStyle(color: textfieldgrey)),
                      TextSpan(
                        text: 'info@cerapp.co',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: blackcolor),
                      ),
                    ],
                  ),
                ),
                10.heightBox,
                const Text(
                    style: TextStyle(color: textfieldgrey, fontSize: 14),
                    textAlign: TextAlign.justify,
                    "Join us in our mission to enhance Mediterranean fruit fly (Ceratitis capitata) population monitoring and make better-informed decisions for a healthier and more productive agricultural environment."),
              ],
            ),
          )
        ],
      )),
    );
  }
}
