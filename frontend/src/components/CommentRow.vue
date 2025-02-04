<template>

    <!-- Loaded -->
    <v-card flat class="wrapper">

        <!-- User Icon -->
        <div class="icon-wrapper">
            <img :src="comment.userImg" alt="User Icon" class="icon">
        </div>

        <!-- Text -->
        <div class="text-wrapper">

            <!-- Top Row | Name and DateTime -->
            <div class="top-row">
                <p>
                    <span class="name">{{ comment.userFirstName }} {{ comment.userLastName }}</span>
                    <span class="dateTime">{{ formattedDateTime }}</span>
                    <span v-if="comment.isEdited" class="edited-flag">(edited)</span>
                </p>
            </div>

            <!-- Comment | Not Editing -->
            <p v-if="!isEditing" class="comment">{{ comment.comment }}</p>

            <!-- Comment | Editing -->
            <textarea
                v-else
                v-model="editedComment"
                class="comment-input"
                ref="textarea"
                @input="autoResize"
                @keydown.enter.exact.prevent="updateComment"
                @keydown.esc.exact.prevent="cancelUpdateComment"
            ></textarea>


            <!-- Bottom Row | Not Editing -->
            <div v-if="!isEditing" class="bottom-row">

                <!-- Likes -->
                <div
                    @click="likeComment"
                    :class="[ 'likes', 'btn', isLikedByUser ? 'isLikedByUser' : '' ]"
                >
                    <v-icon
                        :class="[ { wiggle: isLikedByUserClicked }]"
                        icon="mdi-thumb-up"
                    />
                    <span>{{ comment.likes }}</span>
                </div>

                <!-- Edit -->
                <div
                    v-if="isWrittenByUser"
                    class="edit btn"
                    @click="editComment"
                >
                    <v-icon icon="mdi-square-edit-outline" />
                    <span>edit</span>
                </div>

            </div>

            <!-- Bottom Row | Editing -->
            <div v-if="isEditing" class="bottom-row right-align">

                <!-- Delete -->
                <div
                    v-if="isWrittenByUser"
                    class="delete btn"
                    @click="deleteComment"
                >
                    <v-icon icon="mdi-delete" />
                    <span>delete</span>
                </div>

                <!-- Cancel -->
                <div
                    class="cancel btn"
                    @click="cancelUpdateComment"
                >
                    <v-icon icon="mdi-cancel" />
                    <span>cancel</span>
                </div>

                <!-- Update -->
                <div
                    class="cancel btn"
                    @click="updateComment"
                >
                    <v-icon icon="mdi-content-save-edit" />
                    <span>update</span>
                </div>

            </div>

        </div>

    </v-card>
</template>

<script lang="ts">
    import { defineComponent } from 'vue';
    import { CommentItem } from '@/models/CommentItem'
    import { Server } from '@/config/Server';
    import { Focus } from '@/models/Focus';

    import { storeToRefs } from 'pinia';
    import { useSessionStore } from '@/stores/session';
    import { formatDateTimeRelative } from '@/utils/formatDateTime';
    import { useSnackbarStore } from '@/stores/showSnackbar';

    export default defineComponent({
        name: 'CommentRow',

        setup() {
            const sessionStore = useSessionStore();
            const { getUser: user } = storeToRefs(sessionStore);

            const snackbar = useSnackbarStore();
            return { sessionStore, user, snackbar };
        },

        props: {
            comment: {
                type: Object as () => CommentItem,
                required: true
            },

            focus: {
                type: Object as () => Focus,
                required: true
            }
        },

        data() {
            return {
                isEditing: false,
                isLikedByUser: false,
                isLikedByUserClicked: false,
                editedComment: this.comment.comment,
                now: new Date(),
                intervalId: null as number | null
            }
        },

        computed: {

            isWrittenByUser() : boolean {
                return this.user?.userId == this.comment.userId;
            },

            formattedDateTime(): string {
                return formatDateTimeRelative(this.comment.dateTime);
            }
        },

        methods: {

            formatDateTimeRelative,

            async deleteComment() {
                try {
                    const response = await fetch(
                        `${Server}/delete/${this.focus.type}/comment/${this.comment.commentId}`,
                        { method: 'DELETE' }
                    );
                    const status = response.status;

                    if (status !== 200) {
                        throw new Error('Failed to delete comment');
                    }

                    this.snackbar.showSnackbar('Commented successfully deleted!');
                    this.$emit('commentUpdated');

                } catch (error) {

                    this.snackbar.showSnackbar('Unable to delete comment.');
                    console.error(error);

                } finally {
                    this.isEditing = false;

                }

            },

            cancelUpdateComment() {
                this.editedComment = this.comment.comment;
                this.isEditing = false;
            },

            async updateComment() {
                try {

                    const payload = { comment: this.editedComment };

                    const response = await fetch(
                        `${Server}/put/${this.focus.type}/comment/${this.comment.commentId}`, {
                            method: 'PUT',
                            headers: { "Content-Type": "application/json" },
                            body: JSON.stringify(payload)
                        });

                    const status = response.status;

                    if (status !== 200) {
                        throw new Error('Failed to delete comment');
                    }

                    this.snackbar.showSnackbar('Commented successfully updated');
                    this.$emit('commentUpdated');

                } catch (error) {
                    this.snackbar.showSnackbar('Unable to update comment.');
                    console.error(error);

                } finally {
                    this.isEditing = false;

                }
            },

            async likeComment() {

                this.isLikedByUserClicked = true;

                setTimeout(() => {
                    this.isLikedByUserClicked = false;
                }, 500);

                if (!this.user) {
                    this.snackbar.showSnackbar('Please log in or sign up to like comments');
                    return;
                }

                const crud = (this.isLikedByUser) ? 'delete' : 'post';
                const address = (this.isLikedByUser) ? 'unlike-comment' : 'like-comment';

                try {
                    const response = await fetch(
                        `${Server}/${crud}/${this.focus.type}/${address}/${this.comment.commentId}/${this.user?.userId}`,
                        { method: crud.toUpperCase() }
                    );
                    const status = response.status;

                    if (status !== 200) {
                        if (crud === 'post') throw new Error('Failed to like comment');
                        else throw new Error('Failed to unlike comment');
                    }

                    this.isLikedByUser = !this.isLikedByUser
                    this.$emit('commentUpdated');

                } catch (error) {
                    console.error(error)
                }

            },

            async isUserLikedComment() {
                const response = await fetch(`${Server}/get/${this.focus.type}/is-user-liked-comment/${this.comment.commentId}/${this.user?.userId}`);
                const data = await response.json();

                this.isLikedByUser = data[0].isUserLikedComment;

            },

            autoResize() {
                this.$nextTick(() => {
                    const textarea = this.$refs.textarea as HTMLTextAreaElement;
                    if (textarea) {
                        textarea.style.height = "auto";
                        textarea.style.height = textarea.scrollHeight + "px";
                    }
                });
            },

            editComment() {
                this.isEditing = true;
                this.$nextTick(() => {
                    this.autoResize();
                    this.$nextTick(() => {
                        const textarea = this.$refs.textarea as HTMLTextAreaElement;
                        if (textarea) {
                            textarea.focus();
                            textarea.setSelectionRange(textarea.value.length, textarea.value.length);
                        }
                    });
                });
            }

        },

        watch: {
            comment: {
                handler(newComment) {
                    this.editedComment = newComment.comment;
                },
                immediate: true
            }
        },

        mounted() {
            this.isUserLikedComment();

            this.intervalId = setInterval(() => {
                this.now = new Date();
            }, 60000);
        },

        beforeUnmount() {
            if (this.intervalId) {
                clearInterval(this.intervalId);
            }
        }

    });
</script>

<style scoped>

    .wrapper {
        display: flex;
        flex-direction: row;
        justify-content: flex-start;
        align-items: flex-start;
        gap: 20px;
        padding: 12px;
        transition: all 0.3s ease-in-out;
        position: relative;
    }

    .wrapper:hover {
        background-color: var(--c-bg-subtle-highlight);
    }

    .icon-wrapper {
        width: 48px;
        aspect-ratio: 1;
        border-radius: 50%;
        overflow: hidden;
        flex-shrink: 0;
    }

    .icon {
        width: 100%;
        height: 100%;
        min-width: 100%;
        min-height: 100%;
    }

    .text-wrapper {
        width: 100%;
    }

    .name {
        font-family: 'Poppins-SemiBold', sans-serif;
    }

    .dateTime,
    .edited-flag {
        font-family: 'Poppins-ExtraLight', sans-serif;
        margin-left: 1rem;
        font-size: .8rem;
    }

    .comment {
        margin-top: 8px;
        margin-left: 0px;
        margin-right: 16px;
        margin-bottom: 16px;
    }

    .comment-input {
        width: 100%;
        min-height: fit-content;
        height: auto;
        overflow: hidden;
        resize: none;
        font-size: 1rem;
        font-family: inherit;
        margin: 0;
        padding: 8px;
        transition: all 0.2s ease-in-out;
        caret-color: var(--c-text);
        border: 1px solid var(--c-text);
        border-radius: 4px;
        transform: translateX(-9px) translateY(-1px);
    }

    .bottom-row {
        display: flex;
        flex-direction: row;
        gap: 2rem;
        font-size: .8rem;
    }

    .right-align {
        justify-content: right;
    }

    .v-icon {
        font-size: 1rem;
        margin-right: 4px;
    }

    .likes .v-icon {
        margin-right: 8px;
    }

    .btn {
        color: var(--c-text-muted);
        cursor: pointer;
        transition: all 0.2s ease-in-out;
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
    }

    .btn:hover {
        color: var(--c-text);
    }

    .delete {
        color: var(--c-text-warning);
    }

    .delete:hover {
        color: var(--c-text-warning-lvl2);
    }

    .isLikedByUser {
        color: var(--c-text-liked);
    }

    .isLikedByUser:hover {
        color: var(--c-text-liked);
    }

    @keyframes wiggle {
        0% {
            transform: rotate(0deg);
        }
        25% {
            transform: rotate(10deg);
        }
        50% {
            transform: rotate(-10deg);
        }
        75% {
            transform: rotate(5deg);
        }
        100% {
            transform: rotate(0deg);
        }
    }

    .wiggle {
        animation: wiggle 0.5s ease-in-out;
    }


</style>
