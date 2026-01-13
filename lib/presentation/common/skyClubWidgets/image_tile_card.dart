import 'package:flutter/material.dart';

class ImageTileCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double? width;
  final double? height;
  final VoidCallback onButtonPressed;

  const ImageTileCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    this.width,
    this.height,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: width ?? 210, // Default width
      height: height ?? 256, // Default height
      child: Stack(
        children: [
          // Background image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: width ?? 210,
              height: height ?? 256,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Center(
                  child: Icon(
                    Icons.broken_image,
                    size: 50,
                    color: Colors.grey.shade400,
                  ),
                );
              },
            ),
          ),
          
          // Gradient Overlay
          Positioned.fill(
            child: Container(
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.5),
                  ],
                ),
              ),
            ),
          ),
          

          // Title, Button, and Description Overlay
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Row (Title and Button)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start, // Aligns button with the first line of the title
                    children: [
                      // Title
                      Expanded(
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                            shadows: [
                              Shadow(
                                color: Colors.black54,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          maxLines: 2, // Allows wrapping to a second line
                          overflow: TextOverflow.ellipsis, // Optional, in case of excessive length
                        ),
                      ),

                      // Button
                      Container(
                        height: 30,
                        width: 30,
                        margin: const EdgeInsets.only(left: 8), // Adds spacing from the title
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Colors.black,
                            size: 15,
                          ),
                          onPressed: onButtonPressed,
                        ),
                      ),
                    ],
                  ),


                  const Spacer(), // Push the description to the bottom

                  // Description
                  Text(
                    description,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black54,
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
