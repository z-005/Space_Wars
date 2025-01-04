extends Node2D



func run_tween():
	$Path2D/PathFollow2D/Kami_path/Tween.interpolate_property(
		$Path2D/PathFollow2D, "unit_offset",
		0.0, 1.0, 9.5, Tween.TRANS_LINEAR, Tween.EASE_IN
	)
	$Path2D2/PathFollow2D/Kami_path/Tween.interpolate_property(
		$Path2D2/PathFollow2D, "unit_offset",
		0.0, 1.0, 9.0, Tween.TRANS_LINEAR, Tween.EASE_IN
	)
	$Path2D3/PathFollow2D/Kami_path/Tween.interpolate_property(
		$Path2D3/PathFollow2D, "unit_offset",
		0.0, 1.0, 8.5, Tween.TRANS_LINEAR, Tween.EASE_IN
	)
	$Path2D4/PathFollow2D/Kami_path/Tween.interpolate_property(
		$Path2D4/PathFollow2D, "unit_offset",
		0.0, 1.0, 8.0, Tween.TRANS_LINEAR, Tween.EASE_IN
	)
	$Path2D5/PathFollow2D/Kami_path/Tween.interpolate_property(
		$Path2D5/PathFollow2D, "unit_offset",
		0.0, 1.0, 7.5, Tween.TRANS_LINEAR, Tween.EASE_IN
	)
	$Path2D6/PathFollow2D/Kami_path/Tween.interpolate_property(
		$Path2D6/PathFollow2D, "unit_offset",
		0.0, 1.0, 7.0, Tween.TRANS_LINEAR, Tween.EASE_IN
	)
	
	$Path2D/PathFollow2D/Kami_path/Tween.start()
	$Path2D2/PathFollow2D/Kami_path/Tween.start()
	$Path2D3/PathFollow2D/Kami_path/Tween.start()
	$Path2D4/PathFollow2D/Kami_path/Tween.start()
	$Path2D5/PathFollow2D/Kami_path/Tween.start()
	$Path2D6/PathFollow2D/Kami_path/Tween.start()

	yield($Path2D/PathFollow2D/Kami_path/Tween, "tween_all_completed")
	yield($Path2D2/PathFollow2D/Kami_path/Tween, "tween_all_completed")
	yield($Path2D3/PathFollow2D/Kami_path/Tween, "tween_all_completed")
	yield($Path2D4/PathFollow2D/Kami_path/Tween, "tween_all_completed")
	yield($Path2D5/PathFollow2D/Kami_path/Tween, "tween_all_completed")
	yield($Path2D6/PathFollow2D/Kami_path/Tween, "tween_all_completed")
	





func _on_Path_Kami_visibility_changed():
	run_tween()
