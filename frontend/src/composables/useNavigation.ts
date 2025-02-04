import { useRouter } from 'vue-router';

export function useNavigation() {
    const router = useRouter();

    function goTo(focusType: string, focusId?: number, event?: MouseEvent) {
        const route = focusId !== undefined
            ? {
                name: `${focusType}-focus`,
                params: { id: focusId },
            }
            : { name: focusType };

        // If the user is holding down the control key or command key, open the route in a new tab
        if (event && (event.ctrlKey || event.metaKey)) {

            const resolved = router.resolve(route);
            window.open(resolved.href, '_blank');

        // Otherwise, navigate to the route in the current tab
        } else {

            router.push(route);

            // Scroll to top
            window.scrollTo({
                top: 0,
            });
        }
    }

    return { goTo };
}
