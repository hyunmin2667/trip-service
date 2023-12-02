<script setup>

const props = defineProps(['board-list']);
const emit = defineEmits(['board-detail']);

const boardDetail = (boardId) => { emit('board-detail', boardId) }

</script>
<template>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">제목</th>
          <th scope="col">조회수</th>
          <th scope="col">작성자</th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="(boardItem, index) in boardList"
          v-bind:key="index"
          @click="boardDetail(boardItem.boardId)"
        >
          <th scope="row">{{ boardItem.boardId }}</th>
          <td>{{ boardItem.boardTitle }}</td>
          <td>{{ boardItem.boardViewCount }}</td>
          <td>{{ boardItem.boardAuthor }}</td>
        </tr>
      </tbody>
    </table>
  
</template>


<style scoped>
tr {
  border-left: 2px solid #FFF;
}
tr:hover {
  box-shadow: 0 2px 10px rgba(255, 136, 0, 0.2);
  cursor: pointer;
  border-left: 2px solid var(--bs-orange);
}
</style>