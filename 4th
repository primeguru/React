import React, { useState } from 'react';

const ToDoFunction = () => {
  const [tasks, setTasks] = useState([]);
  const [newTask, setNewTask] = useState('');

  const addTask = () => {
    if (newTask.trim()) {
      setTasks([...tasks, { id: Date.now(), text: newTask, completed: false }]);
      setNewTask('');
    }
  };

  const deleteTask = (id) => setTasks(tasks.filter(task => task.id !== id));

  const toggleTaskCompletion = (id) => {
    setTasks(tasks.map(task =>
      task.id === id ? { ...task, completed: !task.completed } : task
    ));
  };

  return (
    <div className="todo-container">
      <h2 className="todo-header">To-Do List</h2>
      <div className="todo-input-wrapper">
        <input
          type="text"
          value={newTask}
          onChange={(e) => setNewTask(e.target.value)}
          placeholder="Add a new task..."
          className="todo-input"
        />
        <button className="add-task-button" onClick={addTask}>Add Task</button>
      </div>
      <ul className="todo-list">
        {tasks.map(({ id, text, completed }) => (
          <li key={id} className={`todo-item ${completed ? 'completed' : ''}`}>
            <span className="task-text" onClick={() => toggleTaskCompletion(id)}>{text}</span>
            <button className="delete-button" onClick={() => deleteTask(id)}>❌</button>
          </li>
        ))}
      </ul>
    </div>
  );
};

export default ToDoFunction;
