<template>

    <!-- Title Wrapper -->
    <div class="title-wrapper">

        <!-- Divider Bar -->
        <DividerBar :text="'Comments'" />

        <!-- Pagination -->
        <div v-if="comments.length > commentsPerPage" class="pagination">
            <!-- Previous -->
            <button
                @click="prevPage"
                :disabled="currentPage === 1"
                :style="{ color: currentPage === 1 ? 'var(--c-text-muted)' : 'inherit' }"
            >
                Previous
            </button>

            <!-- Page Count -->
            <span>Page {{ currentPage }} of {{ totalPages }}</span>

            <!-- Next -->
            <button
                @click="nextPage"
                :disabled="currentPage === totalPages"
                :style="{ color: currentPage === totalPages ? 'var(--c-text-muted)' : 'inherit' }"
            >
                Next
            </button>
        </div>

    </div>

    <!-- Comments -->
    <div v-if="comments.length > 0" class="comments-wrapper">
        <CommentRow
            v-for="(comment, index) in paginatedComments"
            :key="index"
            :comment="comment"
            :focus="focus"
            @commentUpdated="handleCommentUpdated"
        />
    </div>

    <!-- Add Comment -->
    <v-form
        ref="form"
        validate-on="submit"
        @submit.prevent="submit"
    >
        <v-text-field
            class="comment-input"
            v-model="newComment"
            :counter="512"
            :rules="newCommentRules"
            :label="commentLabel"
            required
            :disabled="!user"
        />
        <v-btn
            class="submit-button"
            :loading="isSubmitting"
            text="Submit"
            type="submit"
            block
            :disabled="!isFormValid || !user"
        />
    </v-form>

</template>

<script lang="ts">
    import { defineComponent } from 'vue';
    import { Focus } from '@/models/Focus';
    import { CommentItem } from '@/models/CommentItem';
    import { Server } from '@/config/Server';
    import CommentRow from './CommentRow.vue';
    import DividerBar from './DividerBar.vue';

    import { storeToRefs } from 'pinia';
    import { useSessionStore } from '@/stores/session';

    export default defineComponent({
        name: 'CommentSection',

        setup() {
            const sessionStore = useSessionStore();
            const { getUser: user } = storeToRefs(sessionStore);
            return { sessionStore, user };
        },

        props: {
            focus: {
                type: Object as () => Focus,
                required: true
            }
        },

        components: {
            DividerBar,
            CommentRow
        },

        data() {
            return {
                comments: [] as CommentItem[],
                currentPage: 1,
                commentsPerPage: 3,
                newComment: '',
                newCommentRules: [
                    (value: string) => {
                        return (value && value.trim().length > 0) || 'Comment cannot be empty';
                    },
                    (value: string) => {
                        return (value?.length <= 512) || 'Comment must be less than 512 characters';
                    }
                ],
                isSubmitting: false
            }
        },

        computed: {
            totalPages(): number {
                return Math.ceil(this.comments.length / this.commentsPerPage);
            },

            paginatedComments(): CommentItem[] {
                const start = (this.currentPage - 1) * this.commentsPerPage;
                const end = start + this.commentsPerPage;
                return this.comments.slice(start, end);
            },

            commentLabel(): string {
                if (!this.user) {
                    return 'Please log in or sign up to leave a comment';
                }

                return (this.comments.length > 0)
                    ? 'Join the conversation'
                    : 'Be the first to leave a comment!'
            },

            isFormValid(): boolean {
                return this.newComment.trim().length > 0 && this.newComment.length <= 512;
            }
        },

        methods: {
            nextPage() {
                if (this.currentPage < this.totalPages) {
                    this.currentPage++;
                }
            },

            prevPage() {
                if (this.currentPage > 1) {
                    this.currentPage--;
                }
            },

            handleCommentUpdated() {
                this.getComments();
            },

            async submit(event: Event): Promise<void> {
                event.preventDefault();

                const { valid } = await (this.$refs.form as any).validate();

                if (!valid) {
                    return;
                }

                this.isSubmitting = true;

                const apiUrl = `${Server}/post/${this.focus.type}/comment/${this.focus.id}/${this.user?.userId}`;
                const payload = { comment: this.newComment };

                try {
                    const response = await fetch(apiUrl, {
                        method: "POST",
                        headers: { "Content-Type": "application/json" },
                        body: JSON.stringify(payload),
                    });

                    if (!response.ok) {
                        const errorText = await response.text();
                        throw new Error(`Failed to post comment: ${errorText}`);
                    }

                    this.newComment = '';
                    this.getComments();

                } catch (error) {
                    console.log('Unsuccessful attempt to add comment to database: ', error);
                    alert('Failed to post comment: ' + error);

                } finally {
                    this.isSubmitting = false;
                }
            },

            async getComments() {
                try {
                    const response = await fetch(`${Server}/get/${this.focus.type}/comments/${this.focus.id}`);
                    const data = await response.json();

                    this.comments = data.map((comment: any) => new CommentItem(
                        comment.CommentID,
                        comment.UserID,
                        comment.FirstName,
                        comment.LastName,
                        comment.UserImg,
                        comment.DateTime,
                        comment.Comment,
                        comment.Likes,
                        comment.IsEdited
                    ));

                    await this.$nextTick();

                } catch (error) {
                    console.log('Error fetching comments:', error);
                }
            }
        },

        mounted() {
            this.getComments();
        }
    });
</script>

<style scoped>

    .title-wrapper {
        display: flex;
        flex-direction: row;
        align-items: center;
        justify-content: center;
        gap: 16px;
        margin-top: 60px;
    }

    .pagination {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-shrink: 0;
    }

    .pagination button {
        margin: 0 10px;
    }

    .comments-wrapper {
        min-height: 348px;
        margin-top: 12px;
    }

    .v-form {
        margin: 20px 0;
    }

    .submit-button {
        margin-top: 12px;
        background-color: var(--c-bg-subtle-highlight);
    }

</style>