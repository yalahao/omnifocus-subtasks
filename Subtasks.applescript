set taskTitle to text returned of (display dialog "What is the task?" default answer "")
set numSubtasks to text returned of (display dialog "How many subtasks to create?" default answer 1) as integer
set myContext to "Focus"

tell application "OmniFocus"
	tell document of front window
		set i to 1
		repeat (numSubtasks) times
			set subtaskTitle to taskTitle & " " & i & "/" & numSubtasks
			set theContext to first flattened context where its name is myContext
			set newTask to make new inbox task with properties {name:subtaskTitle, context:theContext}
			set i to i + 1
		end repeat
	end tell
end tell