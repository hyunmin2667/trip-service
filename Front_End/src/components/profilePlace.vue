<script setup>

const props = defineProps(['board-list']);
const emit = defineEmits(['board-detail']);

const boardDetail = (boardId) => { emit('board-detail', boardId) }

</script>
<template>
  <div class="container">

    <div class="card" v-for="(boardItem, index) in boardList" v-bind:key="index" @click="boardDetail(boardItem.boardId)">
      <div class="card-header">
        <img :src="'https://picsum.photos/id/' + 1 + boardItem.boardId * 2 + '/300/200'" alt="" />
      </div>
      <div class="card-body">
        <div class="user">
          <img src="https://upload.wikimedia.org/wikipedia/commons/4/48/Outdoors-man-portrait_%28cropped%29.jpg" alt="" />
          <div class="user-info">
            <h5>{{ boardItem.boardAuthor }}</h5>
            <small>2h ago</small>
          </div>
        </div>
        <div>
          <span class="tag tag-cyan">#여행</span>
          <span class="tag tag-orange">#떠나요</span>
        </div>
        <h4>{{ boardItem.boardTitle }}</h4>
        <p>
          Lorem ipsum, dolor sit amet consectetur adipisicing elit. Aspernatur
          tenetur distinctio neque?
        </p>
      </div>
    </div>

  </div>
</template>

<style scoped>
.container {
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 20px;
  margin: auto;
}

.card {
  background-color: #fff;
  border-radius: 10px;
  border: 0px;
  box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  width: 300px;
  height: 400px;
}

.card:hover {
  box-shadow: 0 2px 20px rgba(255, 136, 0, 0.2);
  cursor: pointer;
}

.card-header {
  padding: 0;
}

.card-header img {
  width: 100%;
  height: 200px;
  object-fit: cover;
}

.card-body {
  display: flex;
  flex-direction: column;
  align-items: start;
  padding: 20px;
  min-height: 200px;
}

.tag {
  background-color: #ccc;
  color: #fff;
  border-radius: 50px;
  font-size: 12px;
  margin: 0 5px 0 0;
  padding: 2px 10px;
  text-transform: uppercase;
}

.tag-cyan {
  background-color: var(--bs-cyan);
}

.tag-orange {
  background-color: var(--bs-orange);
}

.tag-pink {
  background-color: #c62bcd;
}

.card-body h4 {
  margin: 10px 0;
}

.card-body p {
  margin-top: auto;
  font-size: 14px;
  font-weight: 500;
  margin: 0;
  color: rgb(70, 68, 68);

  display: block;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: normal;
/*        height: 4.8em;*/
  text-align: left;
  word-wrap: break-word;
  display: -webkit-box;
  -webkit-line-clamp: 2 ;
  -webkit-box-orient: vertical;
}

.user {
  display: flex;
  /* margin-top: auto; */
}

.user img {
  width: 30px;
  height: 30px;
  border-radius: 50%;
  margin-right: 10px;
  object-fit: cover;
}

.user-info h5 {
  font-size: 12px;
  margin: 0;

}

.user-info small {
  font-size: 10px;
  color: #888785;
  margin: 0;

}

@media (max-width: 1400px) {
  .container {
    grid-template-columns: repeat(3, 1fr);
    justify-items: center;
  }
}

@media (max-width: 1000px) {
  .container {
    grid-template-columns: repeat(2, 1fr);
    justify-items: center;
  }
}

@media (max-width: 780px) {
  .container {
    grid-template-columns: repeat(1, 1fr);
    justify-items: center;
  }
}
</style>