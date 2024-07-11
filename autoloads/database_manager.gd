extends Node

const COLLECTION_NAME_PLAYERS = "players"

signal firestore_error(code, status, message)
signal player_data_changed(data: Dictionary)

func _ready():
	var firestore = Firebase.Firestore
	firestore.connect("error", Callable(self, "_on_firestore_error"))

func _on_firestore_error(code, status, message):
	emit_signal("firestore_error", code, status, message)
	print("Firestore error:", code, status, message)
	
func create_empty_player_document(user_id: String) -> void:
	var firestore_collection: FirestoreCollection = Firebase.Firestore.collection(COLLECTION_NAME_PLAYERS)
	var data: Dictionary = {
		"username": "",
		"avatar_id": 0,
		"avatar_img": "",
		"score": 0
	}  # Empty dictionary for creating an empty document
	var document = await firestore_collection.add(user_id, data)
	
	if document:
		print("Empty document created for user:", user_id)
	else:
		print("Failed to create document for user:", user_id)

func save_score(user_id: String, score: int) -> void:
	var firestore_collection: FirestoreCollection = Firebase.Firestore.collection(COLLECTION_NAME_PLAYERS)
	var document = await firestore_collection.get_doc(user_id)
	if document and not document.is_null_value("score"):
		var current_score = int(document.get_value("score"))
		var new_score = current_score + score
		document.add_or_update_field("score", new_score)
		await firestore_collection.update(document)
	else:
		var data: Dictionary = {
			"score": score
		}
		document = await firestore_collection.add(user_id, data)
		
func update_player_data(user_id: String, username: String, avatar_id: int, avatar_img: String) -> void:
	var firestore_collection: FirestoreCollection = Firebase.Firestore.collection(COLLECTION_NAME_PLAYERS)
	var document = await firestore_collection.get_doc(user_id)
	if document:
		document.add_or_update_field("username", username)

		document.add_or_update_field("avatar_id", str(avatar_id))

		document.add_or_update_field("avatar_img", avatar_img)
		print(avatar_img)
		print(typeof(avatar_img))
		var updated_document = await firestore_collection.update(document)
	else:
		print("Error: Document not found for user:", user_id)

func get_player_data(user_id: String):
	var firestore_collection: FirestoreCollection = Firebase.Firestore.collection(COLLECTION_NAME_PLAYERS)
	var document = await firestore_collection.get_doc(user_id, false, true)
	if document:
		player_data_changed.emit(document.document)
	else:
		print("Error: Document not found for user:", user_id)

