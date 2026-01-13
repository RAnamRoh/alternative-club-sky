
class TravelLocation {
  final String name;
  final String description;
  final String imageUrl;


  const TravelLocation({
    required this.name,
    required this.description,
    required this.imageUrl,
  });



  static List<TravelLocation> dummyTravelLocations = [
    const TravelLocation(
      name: 'Lake View',
      description: 'A serene lake with breathtaking views',
      imageUrl: 'https://images.pexels.com/photos/19676932/pexels-photo-19676932/free-photo-of-sunset-over-a-lake.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    ),
    const TravelLocation(
      name: 'Mountain View',
      description: 'A scenic mountain with panoramic views',
      imageUrl: 'https://images.pexels.com/photos/1054218/pexels-photo-1054218.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    ),
    const TravelLocation(
      name: 'City View',
      description: 'A vibrant city with bustling streets',
      imageUrl: 'https://images.pexels.com/photos/169647/pexels-photo-169647.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    ),
    const TravelLocation(
      name: 'Beach View',
      description: 'A peaceful beach with crystal-clear waters',
      imageUrl: 'https://images.pexels.com/photos/994605/pexels-photo-994605.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    ),
    const TravelLocation(
      name: 'Desert View',
      description: 'A desolate desert with sand dunes',
      imageUrl: 'https://images.pexels.com/photos/106606/pexels-photo-106606.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    ),
    const TravelLocation(
      name: 'Forest View',
      description: 'A serene forest with towering trees',
      imageUrl: 'https://images.pexels.com/photos/14435079/pexels-photo-14435079.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    ),
  ];




}