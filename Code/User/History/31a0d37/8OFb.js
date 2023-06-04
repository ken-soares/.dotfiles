import { View } from "react-native";
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

export default TaskInput;
