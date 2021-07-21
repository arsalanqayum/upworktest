// state
export const state = {
  email: ''
}
// getters
export const getters = {
  email: state => state.email
}

// mutations
export const mutations = {
  saveEmail (state, { payload }) {
    state.email = payload
    // console.log(email);
  }
}

// export const mutations = {
//   [types.SAVE_EMAIL](state, { email }) {
//     //alert('hi');
//     console.log(email);
//     state.email = email;
//   }
// };
