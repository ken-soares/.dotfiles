import { useState } from "react";
import {
  ScrollView,
  Button,
  StyleSheet,
  Text,
  TextInput,
  View,
} from "react-native";

export default function App() {
  const [enteredTaskText, setEnteredText] = useState("");
  const [tasks, setTasks] = useState([]);

  function taskInputHandler(enteredText) {
    setEnteredText(enteredText);
  }

  function addTaskHandler() {
    setTasks((currentTask) => [...currentTask, enteredTaskText]);
  }

  return (
    <View style={styles.appContainer}>
      {/* enter task view */}
      <View style={styles.inputContainer}>
        <TextInput
          style={styles.textInput}
          placeholder="Your task"
          onChangeText={taskInputHandler}
        />

        <Button title="add task" onPress={addTaskHandler} />
      </View>

      {/* task list view */}
      <ScrollView style={styles.tasksContainer}>
        {tasks.map((task) => (
          <View style={styles.listItem} key={task}>
            <Text style={{ textAlign: "center", color: "#eee" }}>{task}</Text>
          </View>
        ))}
      </ScrollView>
    </View>
  );
}

const styles = StyleSheet.create({
  appContainer: {
    flex: 1,
    paddingTop: 50,
    paddingHorizontal: 16,
  },

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
  tasksContainer: {
    flex: 4,
  },

  listItem: {
    margin: 8,
    padding: 8,
    fontSize: 15,
    borderRadius: 6,
    backgroundColor: "#5e0acc",
  },
});
