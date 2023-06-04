import { useState } from "react";
import { FlatList, Button, StyleSheet, TextInput, View } from "react-native";

import TaskItem from "./components/TaskItem";

export default function App() {
  const [enteredTaskText, setEnteredText] = useState("");
  const [tasks, setTasks] = useState([]);

  function taskInputHandler(enteredText) {
    setEnteredText(enteredText);
  }

  function addTaskHandler() {
    setTasks((currentTask) => [
      ...currentTask,
      { text: enteredTaskText, key: Math.random().toString() },
    ]);
  }

  return (
    <View style={styles.appContainer}>
      {/* task list view */}
      <View style={styles.tasksContainer}>
        <FlatList
          data={tasks}
          renderItem={(itemData) => {
            return <TaskItem text={itemData.item.text} />;
          }}
        />
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  appContainer: {
    flex: 1,
    paddingTop: 50,
    paddingHorizontal: 16,
  },

  tasksContainer: {
    flex: 4,
  },
});
