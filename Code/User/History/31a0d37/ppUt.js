import { View, StyleSheet, TextInput } from "react-native";
function TaskInput() {
  return (
    /* task input component */
    <View style={styles.inputContainer}>
      <TextInput
        style={styles.textInput}
        placeholder="Your task"
        onChangeText={taskInputHandler}
      />

      <Button title="add task" onPress={addTaskHandler} />
    </View>
  );
}

const styles = StyleSheet.create({
  inputContainer: {
    flex: 1,
    flexDirection: "row",
    justifyContent: "space-between",
    alignItems: "center",
    MarginBottom: 24,
    borderBottomWidth: 1,
    BorderBottomColor: "#cccccc",
  },

  textInput: {
    borderWidth: 1,
    borderColor: "#cccccc",
    width: "70%",
    marginRight: 8,
    padding: 8,
  },
});

function taskInputHandler(enteredText) {
  setEnteredText(enteredText);
}

function addTaskHandler() {
  setTasks((currentTask) => [
    ...currentTask,
    { text: enteredTaskText, key: Math.random().toString() },
  ]);
}
const [enteredTaskText, setEnteredText] = useState("");
const [tasks, setTasks] = useState([]);
export default TaskInput;
