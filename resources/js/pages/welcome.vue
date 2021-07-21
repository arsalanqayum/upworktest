<template>
  <div>
    <div>
      <button class="btn btn-primary btn-block" @click="addColumn()">
        Add Column
      </button>
      <div ref="addColumn" class="modal  fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <form class="modal-content" @submit.prevent="saveColumn()">
            <div class="modal-header">
              <h5 id="exampleModalLabel" class="modal-title">
                {{ title }}
              </h5>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label for="title">Title:</label>
                <input id="title" v-model="title" class="form-control">
                <small v-if="errors.title" class="error">{{ errors.title[0] }}</small>
              </div>

              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">
                  Close
                </button>
                <button type="submit" class="btn btn-primary">
                  Save changes
                </button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
    <div class="agile-board">
      <div v-for="(column,columnIndex) in columns" :key="columnIndex" class="agile-board__column">
        <div class="row">
          <h5 class="colmd-10">
            {{ column.title }}
          </h5>
          <div class="col-md-2 btn-group">
            <button title="Add Card" type="button" class="btn btn-primary btn-sm" @click="showPopup(column)">
              <i class="fa fa-plus" />
            </button>
            <button title="Delete column" type="button" class="btn btn-warning btn-sm" @click="deleteColum(column)">
              <i class="fa fa-trash" />
            </button>
          </div>
        </div>
        <!-- Modal -->

        <ul class="agile-board__issue-list">
          <li v-for="(card,cardIndex) in column.cards" :key="cardIndex" class="issue issue--improvement mb-2 add-border">
            <a title="Click to remove card" href="javascript:void(0);" @click="deleteCard(card.id)">
              <i class="issue__type fa fa-trash" />
            </a>
            <p class="issue__title">
              {{ card.title }}
            </p>
            <a class="align-icon" title="Click to remove card" href="javascript:void(0);" @click="editCard(column,card.id,card)">
              Edit
            </a>
            <div>
              <a href="javascript:void(0);" @click="left(columnIndex,column,card.id)"><i class="fa fa-arrow-circle-left" /> </a>
              <a href="javascript:void(0);" @click="right(columnIndex,column,card.id)"><i class="fa fa-arrow-circle-right" /> </a>
            </div>
          </li>
        </ul>
      </div>
    </div>
    <div>
      <button class="btn btn-block btn-primary" @click="exportDb()">
        Export Db
      </button>
    </div>
    <div ref="exampleModal" class="modal  fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <form class="modal-content" @submit.prevent="saveTask()">
          <div class="modal-header">
            <h5 id="exampleModalLabel" class="modal-title">
              {{ title }}
            </h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="form-group">
              <label for="title">Title:</label>
              <input id="title" v-model="card.title" class="form-control">
              <small v-if="errors.title" class="error">{{ errors.title[0] }}</small>
            </div>
            <div class="form-group">
              <label for="detail">Detail:</label>
              <textarea id="detail" v-model="card.detail" class="form-control" rows="5" />
              <small v-if="errors.detail" class="error">{{ errors.detail[0] }}</small>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">
              Close
            </button>
            <button type="submit" class="btn btn-primary">
              Save changes
            </button>
          </div>
        </form>
      </div>
    </div>
    <div ref="editCard" class="modal  fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <form class="modal-content" @submit.prevent="updateTask()">
          <div class="modal-header">
            <h5 id="exampleModalLabel" class="modal-title">
              {{ title }}
            </h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <div class="form-group">
              <label for="title">Title:</label>
              <input id="title" v-model="card.title" class="form-control">
              <small v-if="errors.title" class="error">{{ errors.title[0] }}</small>
            </div>
            <div class="form-group">
              <label for="detail">Detail:</label>
              <textarea id="detail" v-model="card.detail" class="form-control" rows="5" />
              <small v-if="errors.detail" class="error">{{ errors.detail[0] }}</small>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">
              Close
            </button>
            <button type="submit" class="btn btn-primary">
              Save changes
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
import { mapGetters } from 'vuex'
import draggable from 'vuedraggable'
import axios from 'axios'

export default {
  components: {
    draggable
  },
  layout: 'default',

  metaInfo () {
    return { title: this.$t('home') }
  },

  data () {
    return {
      // eslint-disable-next-line no-labels,no-unused-expressions
      columns: [],
      errors: [],
      title: '',
      card: {
        title: '',
        column_id: '',
        cardId: '',
        detail: ''
      }
    }
  },
  created () {
    this.getColumn()
  },
  methods: {
    left (index, item, cardId) {
      // console.log(index, item)
      if (index > 0) {
        const columnId = this.columns[index - 1].id
        axios.put('/api/cards/sort-order', { columnId: columnId, cardId: cardId }).then(success => {
          this.getColumn()
          this.$toast.open('Card moved to left column Successfully. ')
        })
      }
    },
    right (index, item, cardId) {
      // eslint-disable-next-line no-undef
      if (index + 1 < this.columns.length) {
        const columnId = this.columns[index + 1].id

        axios.put('/api/cards/sort-order', { columnId: columnId, cardId: cardId }).then(success => {
          this.getColumn()
          this.$toast.open('Card moved to right column Successfully. ')
        })
      }
    },
    exportDb () {
      axios.get('/api/dump-db').then(success => {
        window.location = success.data.data
        this.$toast.open('Database exported Successfully. ')
      })
    },
    addColumn () {
      $(this.$refs.addColumn).modal()
    },
    saveColumn () {
      axios.post('/api/column/', { title: this.title }).then(success => {
        $(this.$refs.addColumn).modal('hide')
        this.title = ''
        this.getColumn()
        this.$toast.open('Column created  Successfully. ')
      }).catch(error => {
        if (error.response.status === 422) {
          this.errors = error.response.data.errors
        }
      })
    },
    showPopup (item) {
      this.title = item.title
      this.card.column_id = item.id
      $(this.$refs.exampleModal).modal()
    },
    deleteColum (item) {
      console.log(item.id)
      axios.delete('/api/column/' + item.id).then(success => {
        this.getColumn()
        this.$toast.open('Column deleted  Successfully. ')
      })
    },
    editCard (item, Id, Card) {
      this.title = item.title
      this.card.cardId = Id
      this.card.title = Card.title
      this.card.detail = Card.description
      $(this.$refs.editCard).modal()
    },
    updateTask () {
      axios.put('/api/cards/card', {
        taskId: this.card.cardId,
        title: this.card.title,
        detail: this.card.detail
      }).then(success => {
        $(this.$refs.editCard).modal('hide')
        this.getColumn()
        this.errors = []
        this.card.detail = ''
        this.card.title = ''
        this.$toast.open('Task updated  Successfully. ')
      }).catch(error => {
        if (error.response.status === 422) {
          this.errors = error.response.data.errors
        }
      })
    },
    saveTask () {
      axios.post('/api/cards/card', {
        column_id: this.card.column_id,
        detail: this.card.detail,
        title: this.card.title
      }).then(success => {
        $(this.$refs.exampleModal).modal('hide')
        this.getColumn()
        this.errors = []
        this.card.detail = ''
        this.card.title = ''
        this.$toast.open('Column saved  Successfully. ')
      }).catch(error => {

        if (error.response.status === 422) {
          this.errors = error.response.data.errors
        }
      })
    },
    getColumn () {
      axios.get('/api').then(success => {
        this.columns = success.data.data
      })
    },
    deleteCard (id) {
      axios.delete('/api/cards/card/' + id).then(success => {
        this.getColumn()
      })
    }
  },
  computed: mapGetters({
    getEmail: 'welcomeEmail/email',
    getUser: 'auth/user'
  })
}
</script>

<style >

   *,
   *:before,
   *:after {
     box-sizing: border-box;
   }

html {
  font-family: 'Open Sans', sans-serif;
  line-height: 1.618;
}

body { padding: 60px; }

   .agile-board {
     display: flex;
     /*margin: -10px;*/
   }

.agile-board__column {
  display: flex;
  flex-direction: column;
  width: (100% / 4);
  padding: 10px;
}
.align-icon{
  position: relative;
  margin-left: 90%;
  margin-top: 90%;
}
.add-border{
  border-left: 2px solid green;
  border-right: 2px solid green !important;
}

.agile-board__column-title {
  margin-top: 0;
  margin-bottom: 10px;
  padding-bottom: 10px;
  border-bottom: 3px solid get-color(gray, 200);
  font-size: 16px;
  font-weight: 300;
}

.agile-board__issue-list {
  flex-grow: 1;
  width: 100%;
  margin: 0;
  padding: 0;
  background-color: get-color(gray, 50);
}
   .issue {
     display: block;
     position: relative;
     min-height: 90px;
     padding: 1em;
     padding-left: calc(1em + 19px);
     border: 1px solid get-color(gray, 300);
     background-color: white;
     font-size: 14px;
     cursor: move;

&:before {
   content: '';
   position: absolute;
   top: 0;
   bottom: 0;
   left: 0;
   width: 5px;
   background-color: get-color(light-blue, 200);
 }

&:hover {
.issue__number {
  color: get-color(blue);
  border-bottom-color: get-color(blue);
}
}

&.is-resolved {
.issue__number { text-decoration: line-through; }
}

& + .issue { border-top: 0; }
}

.issue__type {
  position: absolute;
  left: 1em;
  top: 18px;
}

.issue__priority {
  position: absolute;
  left: 1em;
  top: calc(1em + 25px);
}

.issue__number,
.issue__title {
  margin-top: 0;
  margin-right: calc(1em + 32px + 5px);
  margin-bottom: 0;
}

.issue__number {
  border-bottom: 1px solid transparent;
  color: black;
  text-transform: uppercase;
  text-decoration: none;
  transition: all 150ms ease-in;
}

.issue__assignee {
  position: absolute;
  right: 1em;
  height: 32px;
  width: 32px;
  overflow: hidden;
  border-radius: 4px;
}

.issue__estimate {
  position: absolute;
  right: 1em;
  bottom: 1em;
  min-height: 1em * 1.618;
  min-width: 2em;
  padding-right: 0.5em;
  padding-left: 0.5em;
  background-color: get-color(gray, 200);
  border-radius: 999em;
  font-size: 11px;
  text-align: center;
}

.issue--bug:before         { background-color: get-color(tomato); }
.issue--improvement:before { background-color: get-color(jade);   }
</style>
