import { createStore } from 'redux';
import RootReducer from '../reducers/root_reducer';
import { applyMiddleware } from 'redux';

const addLoggingToDispatch = (store) => (next) => (action) => {
  let storeDispatch = store.dispatch;
  console.log(store.getState());
  console.log(action);
  let dispatched = storeDispatch(action);
  console.log(store.getState());
  return dispatched;
};

const configureStore = (preloadedState = {}) => {
  const store = createStore(RootReducer, preloadedState, applyMiddleware(addLoggingToDispatch));
  store.subscribe(() => {
    localStorage.state = JSON.stringify(store.getState());
  });
  return store;
};

export default configureStore;
