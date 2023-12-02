<script setup>
import axios from 'axios'
import { ref } from 'vue'
import { useRoute } from 'vue-router'

// const list = async () => {
//   try {
//     // let response = await fetch('/freeBoards')
//     let { data } = await axios.get('http://localhost:8080/freeboard' + boardId)
//     // data 로 이후 비동기 처리 결과
//     console.log(data)
//   } catch (error) {
//     console.error(error)
//   }
// }

const route = useRoute()
const from = ref('')
const content = ref('')
const boardNum = route.query.boardId

// const boardDetail = () => {
//   // from.value = route.query.from
//   // content.value = route.query.content
//   //   from.value = route.params.from
//   //   console.log(route)
//   //   console.log(route.query.boardId)
//   //   content.value = route.query
//   //   console.log(content)
//   //   console.log(content)
// }
// boardDetail()
const board = ref({})

// console.log(route)
console.log(route.query.boardId)
const boardId = route.query.boardId
const boardDetail = async (boardId) => {
  try {
    let { data } = await axios.get('http://localhost:8080/freeboard/' + boardId)
    console.log(data)
    board.value = data
  } catch (error) {
    console.error(error)
  }
}
boardDetail(boardId)
</script>

<template>
  <section class="page-section bg-primary" id="boardDetail">
    <h2>{{ board.boardId }}</h2>
  </section>
  <!-- <h1>{{ title }}</h1> -->
</template>
