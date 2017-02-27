set myContext to "Focus"

set taskTitle to text returned of (display dialog "What is the task?" default answer "")
set numSubtasks to text returned of (display dialog "How many subtasks to create?" default answer 1) as integer
set subtasksPerDay to text returned of (display dialog "How many subtasks per day?" default answer 1) as integer

tell application "OmniFocus"
	tell document of front window
		set i to 1
		set currentTime to time of (current date)
		set d to (current date) - currentTime + (17 * hours)
		set z to subtasksPerDay
		repeat (numSubtasks) times
			set subtaskTitle to taskTitle & " " & i & "/" & numSubtasks
			set theContext to first flattened context where its name is myContext
			set newTask to make new inbox task with properties {name:subtaskTitle, due date:d, context:theContext}
			set i to i + 1
			set z to z - 1
			if z = 0 then
				set z to subtasksPerDay
				set d to d + (1 * days)
			end if
		end repeat
	end tell
end tell
