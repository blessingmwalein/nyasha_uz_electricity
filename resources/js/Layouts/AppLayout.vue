<script setup>
import { ref } from 'vue';
import { Head, Link, router } from '@inertiajs/vue3';
import ApplicationMark from '@/Components/ApplicationMark.vue';
import Banner from '@/Components/Banner.vue';
import Dropdown from '@/Components/Dropdown.vue';
import DropdownLink from '@/Components/DropdownLink.vue';
import NavLink from '@/Components/NavLink.vue';
import ResponsiveNavLink from '@/Components/ResponsiveNavLink.vue';

defineProps({
    title: String,
});

const showingNavigationDropdown = ref(false);

const switchToTeam = (team) => {
    router.put(route('current-team.update'), {
        team_id: team.id,
    }, {
        preserveState: false,
    });
};

const logout = () => {
    router.post(route('logout'));
};
</script>

<template>
    <div class="d-flex flex-column flex-lg-row h-lg-full bg-surface-secondary">
        <nav class="navbar show navbar-vertical h-lg-screen navbar-expand-lg px-0 py-3 navbar-light bg-white border-bottom border-bottom-lg-0 border-end-lg scrollbar"
            id="sidebar">
            <div class="container-fluid"><button class="navbar-toggler ms-n2" type="button" data-bs-toggle="collapse"
                    data-bs-target="#sidebarCollapse" aria-controls="sidebarCollapse" aria-expanded="false"
                    aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button> <a
                    class="navbar-brand d-inline-block py-lg-2 mb-lg-5 px-lg-6 me-0" href="../../index.html"><img
                        src="/assets/img/logos/clever-primary.svg" alt="..."></a>
                <div class="navbar-user d-lg-none">
                    <div class="dropdown"><a href="#" id="sidebarAvatar" role="button" data-bs-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                            <div class="avatar-parent-child"><img alt="..." src="/assets/img/people/img-profile.jpg"
                                    class="avatar avatar- rounded-circle"> <span
                                    class="avatar-child avatar-badge bg-success"></span></div>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end" aria-labelledby="sidebarAvatar">
                            <a href="#" class="dropdown-item">Settings</a>
                            <hr class="dropdown-divider"><a href="#" class="dropdown-item">Logout</a>
                        </div>
                    </div>
                </div>
                <div class="collapse navbar-collapse" id="sidebarCollapse">
                    <ul class="navbar-nav">
                        <li class="nav-item"><a class="nav-link" href="#"><i class="bi bi-briefcase"></i> Dashboard</a>

                        </li>
                        <li class="nav-item"><a class="nav-link" href="#sidebar-tasks" data-bs-toggle="collapse"
                                role="button" aria-expanded="false" aria-controls="sidebar-tasks"><i
                                    class="bi bi-kanban"></i> Zimbabwe</a>
                            <div class="collapse" id="sidebar-tasks">
                                <ul class="nav nav-sm flex-column">
                                    <li class="nav-item"><a href="../tasks/overview.html" class="nav-link">Provinces</a>
                                    </li>
                                    <li class="nav-item"><a href="../tasks/list-view.html" class="nav-link">Cities</a>
                                    </li>
                                    <li class="nav-item"><a href="../tasks/list-view-aside.html"
                                            class="nav-link">Districts</a></li>
                                    <li class="nav-item"><a href="../tasks/board-view.html" class="nav-link">Towns</a>
                                    </li>
                                </ul>
                            </div>
                        </li>

                        <li class="nav-item"><a class="nav-link" href="#sidebar-integrations" data-bs-toggle="collapse"
                                role="button" aria-expanded="false" aria-controls="sidebar-integrations"><i
                                    class="bi bi-terminal"></i> Electricity</a>
                            <div class="collapse" id="sidebar-integrations">
                                <ul class="nav nav-sm flex-column">
                                    <li class="nav-item"><a href="../integrations/applications.html"
                                            class="nav-link">Plants</a></li>
                                    <li class="nav-item"><a href="../integrations/manage-apps.html"
                                            class="nav-link">Generations</a></li>
                                    <li class="nav-item"><a href="../integrations/manage-apps.html"
                                            class="nav-link">Consumption</a></li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="#"><i class="bi bi-people"></i> Clients</a>

                        </li>

                    </ul>
                    <hr class="navbar-divider my-4 opacity-70">


                </div>
            </div>
        </nav>
        <div class="flex-lg-1 h-screen overflow-y-lg-auto">
            <nav class="navbar navbar-light position-lg-sticky top-lg-0 d-none d-lg-block overlap-10 flex-none bg-white border-bottom px-0 py-3"
                id="topbar">
                <div class="container-fluid">
                    <div class="hstack gap-2"><button type="button"
                            class="btn btn-sm btn-square bg-tertiary bg-opacity-20 bg-opacity-100-hover text-tertiary text-white-hover">C</button>
                        <button type="button"
                            class="btn btn-sm btn-square bg-primary bg-opacity-20 bg-opacity-100-hover text-primary text-white-hover">D</button>
                        <button type="button"
                            class="btn btn-sm btn-square bg-warning bg-opacity-20 bg-opacity-100-hover text-warning text-white-hover">A</button>
                        <button type="button" class="btn btn-sm btn-square btn-neutral border-dashed shadow-none"><i
                                class="bi bi-plus-lg"></i></button>
                    </div>

                    <div class="navbar-user d-none d-sm-block">
                        <div class="hstack gap-3 ms-4">
                            <div class="dropdown"><a href="#"
                                    class="nav-link px-3 text-base text-muted text-opacity-70 text-opacity-100-hover"
                                    id="dropdown-notifications" data-bs-toggle="dropdown" aria-expanded="false"><i
                                        class="bi bi-bell-fill"></i></a>
                                <div class="dropdown-menu dropdown-menu-end px-2"
                                    aria-labelledby="dropdown-notifications">
                                    <div class="dropdown-item d-flex align-items-center">
                                        <h6 class="dropdown-header p-0 m-0 font-semibold">Notifications</h6><a href="#"
                                            class="text-sm font-semibold ms-auto">Clear all</a>
                                    </div>
                                    <div class="dropdown-item py-3 d-flex">
                                        <div>
                                            <div class="avatar bg-tertiary text-white rounded-circle">RF</div>
                                        </div>
                                        <div class="flex-fill ms-3">
                                            <div class="text-sm lg-snug w-64 text-wrap"><a href="#"
                                                    class="font-semibold text-heading text-primary-hover">Robert</a>
                                                sent a message to <a href="#"
                                                    class="font-semibold text-heading text-primary-hover">Webpixels</a>
                                            </div><span class="text-muted text-xs">30 mins ago</span>
                                        </div>
                                    </div>
                                    <div class="dropdown-item py-3 d-flex">
                                        <div><img alt="..." src="/assets/img/people/img-1.jpg"
                                                class="avatar rounded-circle"></div>
                                        <div class="flex-fill ms-3">
                                            <div class="text-sm lg-snug w-64 text-wrap"><a href="#"
                                                    class="font-semibold text-heading text-primary-hover">Robert</a>
                                                sent a message to <a href="#"
                                                    class="font-semibold text-heading text-primary-hover">Webpixels</a>
                                            </div><span class="text-muted text-xs">30 mins ago</span>
                                        </div>
                                    </div>
                                    <div class="dropdown-item py-3 d-flex">
                                        <div><img alt="..." src="/assets/img/people/img-2.jpg"
                                                class="avatar rounded-circle"></div>
                                        <div class="flex-fill ms-3">
                                            <div class="text-sm lg-snug w-64 text-wrap"><a href="#"
                                                    class="font-semibold text-heading text-primary-hover">Robert</a>
                                                sent a message to <a href="#"
                                                    class="font-semibold text-heading text-primary-hover">Webpixels</a>
                                            </div><span class="text-muted text-xs">30 mins ago</span>
                                        </div>
                                    </div>
                                    <div class="dropdown-item py-3 d-flex">
                                        <div>
                                            <div class="avatar bg-success text-white rounded-circle">KW</div>
                                        </div>
                                        <div class="flex-fill ms-3">
                                            <div class="text-sm lg-snug w-64 text-wrap"><a href="#"
                                                    class="font-semibold text-heading text-primary-hover">Robert</a>
                                                sent a message to <a href="#"
                                                    class="font-semibold text-heading text-primary-hover">Webpixels</a>
                                            </div><span class="text-muted text-xs">30 mins ago</span>
                                        </div>
                                    </div>
                                    <div class="dropdown-item py-3 d-flex">
                                        <div><img alt="..." src="/assets/img/people/img-4.jpg"
                                                class="avatar rounded-circle"></div>
                                        <div class="flex-fill ms-3">
                                            <div class="text-sm lg-snug w-64 text-wrap"><a href="#"
                                                    class="font-semibold text-heading text-primary-hover">Robert</a>
                                                sent a message to <a href="#"
                                                    class="font-semibold text-heading text-primary-hover">Webpixels</a>
                                            </div><span class="text-muted text-xs">30 mins ago</span>
                                        </div>
                                    </div>
                                    <div class="dropdown-divider"></div>
                                    <div class="dropdown-item py-2 text-center"><a href="#"
                                            class="font-semibold text-muted text-primary-hover">View all</a></div>
                                </div>
                            </div>
                            <div class="dropdown"><a class="d-flex align-items-center" href="#" role="button"
                                    data-bs-toggle="dropdown" aria-haspopup="false" aria-expanded="false">
                                    <div>
                                        <div class="avatar avatar-sm bg-warning rounded-circle text-white"><img
                                                alt="..." src="/assets/img/people/img-profile.jpg"></div>
                                    </div>
                                    <div class="d-none d-sm-block ms-3"><span class="h6">Blessing</span></div>
                                    <div class="d-none d-md-block ms-md-2"><i
                                            class="bi bi-chevron-down text-muted text-xs"></i></div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end">
                                    <div class="dropdown-header"><span class="d-block text-sm text-muted mb-1">Signed in
                                            as</span> <span class="d-block text-heading font-semibold">Blessing
                                            Mwale</span></div>

                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#"><i class="bi bi-gear me-3"></i>Settings </a>
                                    <a class="dropdown-item" href="#"><i class="bi bi-person me-3"></i>Logout</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>

            <main class="py-6 bg-surface-secondary">
                <slot></slot>
            </main>
        </div>
    </div>
</template>
