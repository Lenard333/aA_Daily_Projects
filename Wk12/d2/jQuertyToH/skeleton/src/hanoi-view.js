class HanoiView { 
    constructor(game, $el) {
        this.game = game;
        this.$el = $el;
        this.fromTowerIdx = null;

        this.$el.on('click', 'ul', this.clickTower.bind(this));
        this.setupTowers();
        this.render();
     }
    clickTower(event) {
        debugger
        const clickedTowerIdx = $(event.currentTarget).index();

        if (this.fromTowerIdx === null) {
            this.fromTowerIdx = clickedTowerIdx;
        } else {
            if (!this.game.move(this.fromTowerIdx, clickedTowerIdx)) {
                alert('Invalid Move! Try again.');
            }

            this.fromTowerIdx = null;
        }

        this.render();

        if (this.game.isWon()) {
            this.$el.off('click');
            this.$el.addClass('game-over');
            alert('Good work, you!');
        }
    }
    setupTowers() {
        console.log('sanity check');
        const $board = $('.hanoi');

        for (let index = 0; index < 3; index++) {
            let $ul = $('<ul>');
           for (let index2 = 0; index2 < 3; index2++) {
               let $li = $('<li>');
               $ul.append($li);
            }
            $board.append($ul);
        }
    }
    
    render() {
        const $towers = this.$el.find('ul');
        $towers.removeClass();

        if (this.fromTowerIdx !== null) {
            $towers.eq(this.fromTowerIdx).addClass('selected');
        }

        this.game.towers.forEach((disks, towerIdx) => {
            const $disks = $towers.eq(towerIdx).children();
            $disks.removeClass();

            disks.forEach((diskWidth, diskIdx) => {
                $disks.eq(-1 * (diskIdx + 1)).addClass(`disk-${diskWidth}`);
            });
        });
    }
}

module.exports = HanoiView