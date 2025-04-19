part of 'bloc.dart';

class JobProvider {
  // Add your data-fetching logic here
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Get all tasks
  Future<List<Task>> fetchTasks({required String userId}) async {
    try {
      final taskCollectionRef = _firestore
          .collection('users')
          .doc(userId)
          .collection('tasks');

      // Get all task documents
      QuerySnapshot querySnapshot = await taskCollectionRef.get();

      // Convert each document into a Task using fromJson
      List<Task> tasks =
          querySnapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Task.fromJson(data);
          }).toList();

      return tasks;
    } catch (e) {
      print("Error fetching tasks: $e");
      return [];
    }
  }

  Future<List<Project>> fetchProjects({required String userId}) async {
    try {
      final projectCollectionRef = _firestore
          .collection('users')
          .doc(userId)
          .collection('projects');

      // Get all project documents
      QuerySnapshot querySnapshot = await projectCollectionRef.get();

      // Convert each document into a Project using fromJson
      List<Project> projects =
          querySnapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Project.fromJson(data);
          }).toList();

      return projects;
    } catch (e) {
      print("Error fetching projects: $e");
      return [];
    }
  }

  Future<List<Team>> fetchTeams({required String userId}) async {
    try {
      final teamCollectionRef = _firestore
          .collection('users')
          .doc(userId)
          .collection('teams');

      // Get all team documents
      QuerySnapshot querySnapshot = await teamCollectionRef.get();

      // Convert each document into a Team using fromJson
      List<Team> teams =
          querySnapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Team.fromJson(data);
          }).toList();

      return teams;
    } catch (e) {
      print("Error fetching teams: $e");
      return [];
    }
  }

  Future<List<Event>> fetchEvents({required String userId}) async {
    try {
      final eventCollectionRef = _firestore
          .collection('users')
          .doc(userId)
          .collection('events');

      // Get all event documents
      QuerySnapshot querySnapshot = await eventCollectionRef.get();

      // Convert each document into an Event using fromJson
      List<Event> events =
          querySnapshot.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return Event.fromJson(data);
          }).toList();

      return events;
    } catch (e) {
      print("Error fetching events: $e");
      return [];
    }
  }

  // Create Task
  Future<void> createTask({required Task task, required String userId}) async {
    try {
      final collection = _firestore
          .collection('users')
          .doc(userId)
          .collection('tasks'); // fixed collection name

      final docRef = collection.doc(task.id); // use the pre-generated id

      await docRef.set(task.toJson());
    } catch (e) {
      debugPrint('Error creating task: ${e.toString()}');
    }
  }

  Future<void> createProject({
    required Project project,
    required String userId,
  }) async {
    try {
      final collection = _firestore
          .collection('users')
          .doc(userId)
          .collection('projects'); // Ensure the correct collection

      final docRef = collection.doc(project.id); // use the pre-generated id

      await docRef.set(project.toJson());
    } catch (e) {
      debugPrint('Error creating project: ${e.toString()}');
    }
  }

  Future<void> createEvent({
    required Event event,
    required String userId,
  }) async {
    try {
      final collection = _firestore
          .collection('users')
          .doc(userId)
          .collection('events'); // Correct collection name

      final docRef = collection.doc(event.id); // use the pre-generated id

      await docRef.set(event.toJson());
    } catch (e) {
      debugPrint('Error creating event: ${e.toString()}');
    }
  }

  Future<void> createTeam({required Team team, required String userId}) async {
    try {
      final collection = _firestore
          .collection('users')
          .doc(userId)
          .collection('teams'); // Correct collection name

      final docRef = collection.doc(team.id); // use the pre-generated id

      await docRef.set(team.toJson());
    } catch (e) {
      debugPrint('Error creating team: ${e.toString()}');
    }
  }
}
